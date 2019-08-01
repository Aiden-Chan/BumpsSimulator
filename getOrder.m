function Order = getOrder(app)
    % Gets starting order given a division
    
    if ~exist('OMen','var')
        % Start orders don't exist; load
        if ~exist('startOrder.mat','file')
            % Start orders haven't been read from CUCBC yet; read
            readCUCBC(app);
        end
        load('startOrder.mat','OMen','OWomen');
    end
    
    MWSide = eval(['O' app.RaceButtonGroup.SelectedObject.Text]);
    div = str2double(app.DivisionButtonGroup.SelectedObject.Text);
    
    if length(MWSide) < div
        % Division does not exist; get random boats
        Order = datasample(CollegeList(),app.NumBoats);
    else
        Order = MWSide{div};
        excessBoats = app.NumBoats - length(Order);
        if excessBoats > 0
            Order = [Order; datasample(CollegeList(),excessBoats)];
        end
    end
    
end