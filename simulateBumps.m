function simulateBumps(app)

    % Get speeds
    bMatrix = eye(app.NumBoats);
    baseSpeeds = zeros(1,app.NumBoats);
    bumpable = true(1, app.NumBoats);
    baseBoatPosition = 1:app.NumBoats;
    continueBumping = true;
    for b = 1:app.NumBoats
        baseSpeeds(app.Boats{b}.Position(end)) = app.Boats{b}.Speed;
    end

    speeds = baseSpeeds;
    boatPosition = baseBoatPosition;

    while continueBumping
        continueBumping = false;
        
        % Work out bumps
        speedDiff = diff(speeds);
        [sortedDiff, diffOrder] = sort(speedDiff, 'descend');
        for d = 1:length(speedDiff)
            
            bumpSpeed = sortedDiff(d);
            spoonerPos = boatPosition(diffOrder(d));
            bladerPos = boatPosition(diffOrder(d)+1);
            
            if isBump(bumpSpeed, spoonerPos, bladerPos, bumpable)
                % Swap rows in bMatrix
                tempRow = bMatrix(spoonerPos,:);
                bMatrix(spoonerPos,:) = bMatrix(bladerPos,:);
                bMatrix(bladerPos,:) = tempRow;

                % Make boats ineligible for further bumping
                bumpable(spoonerPos) = false;
                bumpable(bladerPos) = false;

                % Check for further overbumps
                continueBumping = true;
            end
        end

        % Work out remaining boats
        speeds = baseSpeeds(bumpable);
        boatPosition = baseBoatPosition(bumpable);
    end

    % Assign new positions
    newPos = bMatrix * [1:app.NumBoats]';
    for b = 1:app.NumBoats
        app.Boats{b}.Position(end+1) = newPos(app.Boats{b}.Position(end));
    end

        function bump = isBump(bumpSpeed, spoonerPos, bladerPos, bumpable)
            % Chasing crew rows an extra 30m over a ~2k course
            % For an overbump a crew must row an additional 100m over 2k
            speedThreshold = 8 + (bladerPos - spoonerPos -1)*12.5;
            bump = (bumpSpeed >= speedThreshold && bumpable(spoonerPos) && bumpable(bladerPos));
        end
end