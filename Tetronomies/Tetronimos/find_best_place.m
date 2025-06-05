function [bool, rownum, colnum, rot] = find_best_place(board, shape);
    warning('off', 'all')
    rot=0;
    rownum=-100;
    colnum=-100;
    bool=false;
    score=-100;
    turn_shape = shape;
    for turns = 3:-1:0
        [newbool newrownum newcolnum newscore] = find_best_place_for_rotation(board, turn_shape)
        if newbool 
            if newscore >= score
                rownum = newrownum;
                colnum = newcolnum;
            end
            bool = true;
        end
        turn_shape = rot90(shape, turns);
        rot = rot +1
    end
    rot = rot -1; 
end