function plotBoats(app)
    for b = 1:app.NumBoats
        plot(app.Chart, app.Boats{b}.Position, 'o-',...
            'Color', [0 0 0],...
            'MarkerFaceColor', getColour(app.Boats{b}.College),...
            'MarkerEdgeColor', [0 0 0]);
    end
    
    app.Chart.YLim = [0 app.NumBoats+1];
    app.Chart.YTick = 1:app.NumBoats;
    app.Chart.XLim = [1 app.NumDays+1];
    app.Chart.XTick = 1:app.NumDays+1;
end