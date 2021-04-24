function [newposition]=CleanEctopics(position,tm,fa)

%PURPOSE: Clean detections associated to an ectopic beat using the correct
%         anotations in "tm"

for i=2:length(tm)-1
    I = find(position.qrs == round(tm(i)*fa));
    if isfield(position,'Pon')
        if length(position.Pon) > I
            newposition.Pon(i-1) = position.Pon(I);
        else
            newposition.Pon(i-1) = NaN;
        end
    end
    if isfield(position,'P')
        if length(position.P) > I
            newposition.P(i-1) = position.P(I);
        else
            newposition.P(i-1) = NaN;
        end
    end
    if isfield(position,'Poff')
        if length(position.Poff) > I
            newposition.Poff(i-1) = position.Poff(I);
        else
            newposition.Poff(i-1) = NaN;
        end
    end
    if isfield(position,'QRSon')
        if length(position.QRSon) > I
            newposition.QRSon(i-1) = position.QRSon(I);
        else
            newposition.QRSon(i-1) = NaN;
        end
    end
    if isfield(position,'Q')
        if length(position.Q) > I
            newposition.Q(i-1) = position.Q(I);
        else
            newposition.Q(i-1) = NaN;
        end
    end
    if isfield(position,'R')
        if length(position.R) > I
            newposition.R(i-1) = position.R(I);
        else
            newposition.R(i-1) = NaN;
        end
    end
    if isfield(position,'qrs')
        if length(position.qrs) > I
            newposition.qrs(i-1) = position.qrs(I);
        else
            newposition.qrs(i-1) = NaN;
        end
    end
    if isfield(position,'Rprima')
        if length(position.Rprima) > I
            newposition.Rprima(i-1) = position.Rprima(I);
        else
            newposition.Rprima(i-1) = NaN;
        end
    end
    if isfield(position,'S')
        if length(position.S) > I
            newposition.S(i-1) = position.S(I);
        else
            newposition.S(i-1) = NaN;
        end
    end
    if isfield(position,'QRSoff')
        if length(position.QRSoff) > I
            newposition.QRSoff(i-1) = position.QRSoff(I);
        else
            newposition.QRSoff(i-1) = NaN;
        end
    end
    if isfield(position,'Ton')
        if length(position.Ton) > I
            newposition.Ton(i-1) = position.Ton(I);
        else
            newposition.Ton(i-1) = NaN;
        end
    end
    if isfield(position,'T')
        if length(position.T) > I
            newposition.T(i-1) = position.T(I);
        else
            newposition.T(i-1) = NaN;
        end
    end
    if isfield(position,'Tprima')
         if length(position.Tprima) > I
            newposition.Tprima(i-1) = position.Tprima(I);
        else
            newposition.Tprima(i-1) = NaN;
        end
    end
    if isfield(position,'Toff')
         if length(position.Toff) > I
            newposition.Toff(i-1) = position.Toff(I);
        else
            newposition.Toff(i-1) = NaN;
        end
    end
    if isfield(position,'QRSmainpos')
        if length(position.QRSmainpos) > I
            newposition.QRSmainpos(i-1) = position.QRSmainpos(I);
        else
            newposition.QRSmainpos(i-1) = NaN;
        end
    end
    if isfield(position,'QRSmaininv')
        if length(position.QRSmaininv) > I
            newposition.QRSmaininv(i-1) = position.QRSmaininv(I);
        else
            newposition.QRSmaininv(i-1) = NaN;
        end
    end
end
