function rgb = getColour(College)
    coll = College(College ~= ' '); % remove spaces
    coll = coll(coll ~= ''''); % remove apostrophes
    coll = coll(coll ~= '.'); % remove periods

    if ~exist('CollegeColours','var')
        load('CollegeColours.mat','CollegeColours');
    end

    rgb = CollegeColours.(coll)./255;
end
 
%     c.AngliaRuskin = [0 0 0];
%     c.Caius = [29 29 29];
%     c.Christs = [0 0 102];
%     c.Churchill = [255 101 152];
%     c.Clare = [255 255 50];
%     c.ClareHall = [255 255 50];
%     c.CorpusChristi = [152 1 1];
%     c.Darwin = [1 1 101];
%     c.Downing = [152 1 101];
%     c.Emmanuel = [1 1 101];
%     c.FirstandThird = [1 1 101];
%     c.Fitzwilliam = [153 153 153];
%     c.Girton = [0 204 0];
%     c.Homerton = [255 255 255];
%     c.HughesHall = [255 255 255];
%     c.Jesus = [0 0 0];
%     c.Kings = [101 1 101];
%     c.LadyMargaret = [255 1 1];
%     c.LucyCavendish = [1 101 237];
%     c.Magdalene = [204 102 204];
%     c.MurrayEdwards = [255 255 255];
%     c.Newnham = [0 0 48];
%     c.Pembroke = [0 204 255];
%     c.Peterhouse = [0 0 153];
%     c.Queens = [0 101 1];
%     c.Robinson = [1 101 255];
%     c.StCatharines = [152 1 101];
%     c.StEdmunds = [0 102 255];
%     c.Selwyn = [255 255 255];
%     c.SidneySussex = [2 2 101];
%     c.TrinityHall = [0 0 0];
%     c.Wolfson = [0 51 255];