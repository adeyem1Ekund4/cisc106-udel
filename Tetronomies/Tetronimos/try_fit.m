function [fit, fill_score] = try_fit(board,shape)
fit = sum(all(board == ' ' | shape == ' '))==size(board,2);
fill_score = sum(sum(shape == ' ' & board ~= ' '));
end
