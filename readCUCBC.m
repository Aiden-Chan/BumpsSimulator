function readCUCBC(app)
    iURL = ((app.YearSpinner.Value - 2011)*2 - double(app.LentButton.Value) + 6);
    iURL = max(iURL,6); % Mays 2011 is the earliest start order available
    url = ['https://www.cucbc.org/bumps/startorder/' num2str(iURL)];
    data = webread(url);
    tree = htmlTree(data);
    str = extractHTMLText(tree);
    MWStr = split(str,'Women''s Crews');
    OMen = getStartOrder(MWStr(1));
    OWomen = getStartOrder(MWStr(2));
    save('startOrder.mat','OMen','OWomen');  
end

function order = getStartOrder(oStr)
    oStr = split(oStr,'Division');
    oStr(1) = []; % Remove titles
    oStr = mat2cell(oStr,ones(size(oStr))); % Put each division into a cell
    
    numDivisions = length(oStr);
    for d = 1:numDivisions
        % Split by position and remove trailing spaces
        oStr{d} = strtrim(split(oStr{d},["0","1","2","3","4","5","6","7","8","9"]));
        
        % Remove crew number: II, III etc
        istr = regexp(oStr{d},'(III|II|IV|V)$');
        keep = true(size(istr));
        for i = length(istr):-1:1
            if ~isempty(istr{i})
                oStr{d}{i} = char(extractBetween(oStr{d}{i},1,istr{i}-2));
            end
            if isempty(oStr{d}{i})
                keep(i) = false;
            end
        end
        oStr{d} = oStr{d}(keep); % remove empty strings
    end
    
    order = oStr;
end