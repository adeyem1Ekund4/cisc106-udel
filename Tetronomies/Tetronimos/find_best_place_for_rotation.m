function [fits,row,col,score]=find_best_place_for_rotation(board,shape)

fits = false;
row = 0;
col = 0;
score = 0;

for r = 1:(size(board,1)-(size(shape,1)-1))
    for c1 = 1:(size(board,2)-(size(shape,2)-1))
        [shap, rew, celumn] = get_board_slice(board, shape, r, c1);
        [fit, sco] = try_fit(shap,shape);
        if fit == 1
            if sco >= score 
                score = sco;
                row = r;
                col = c1;
            end
            fits = fit;
        end
    end
end

end