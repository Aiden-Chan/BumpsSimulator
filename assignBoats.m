function assignBoats(app)
    % Insert college names into the app
    Order = getOrder(app);
    
    for b = 1:app.NumBoats
        if b <= length(Order)
            app.(['College_' num2str(b)]).Value = Order{b};
        end
    end
    
end