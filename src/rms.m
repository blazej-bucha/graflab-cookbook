function out = rms(a)
% Returns RMS of an array "a".

out = sqrt(sum(a .* a) / length(a));

end
