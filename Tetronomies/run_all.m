function brd = make_board(rows,cols)
if rows==0 cols==0;
    brd=[];
end
for i=1:rows;
    for j=1:cols;
        brd(i,j)= " ";
    end
end
end

function shape = get_shape(letter)
if letter == "I"
    shape = ["I";"I";"I";"I"];
elseif letter == "O"
    shape = ["O" "O";"O" "O"];
elseif letter == "L"
    shape = ["L" "" ""; "L" "" ""; "L" "L" ""];
elseif letter == "J"
    shape = ["J" "J" "J"; " " " " "J"];
elseif letter == "S"
    shape = [" " "S" "S"; "S" "S" " "];
elseif letter == "T"
    shape = ["T" "T" "T"; " " "T" " "];
elseif letter == "Z"
    shape = ["Z" "Z" " "; " " "Z" "Z"];
else
    shape = [];
end
end

function [board_slice, ending_row, ending_column] = get_board_slice(board, shape, row, column)
    [length1, width1] = size(board);
    [ending_row, ending_column] = size(shape);
    ending_row = ending_row + row - 1;
    ending_column = ending_column + column - 1;
    if (ending_row <= length1) && (ending_column <= width1)
        board_slice = board(row:ending_row, column:ending_column);
    elseif (ending_row > length1) || (ending_column > width1)
        board_slice = [ ];
    end
end
   
function new_board = place_shape(board, shape, row, column)
    [board_slice, ending_row, ending_column] = get_board_slice(board, shape, row, column);
    new_board = board;
    board_slice(shape ~= ' ') = shape(shape ~= ' ');
    new_board(row:ending_row, column:ending_column) = board_slice;
    if isempty(shape)
        new_board = board;
    end
end

function[fit, fill_score] = try_fit(board, shape)
fit = sum(all(board == ' ' | shape == ' ')) == size(board, 2);
fill_score = sum(sum(shape == ' ' & board ~= ' '));
end

function [fits, best_row, best_col, score] = find_best_place_for_rotation(board, shape)
    [bd_rows, bd_col] = size(board);
    fits = 0;
    best_row = 0;
    best_col = 0;
    score = 0;
    for row = 1:bd_rows
        for column = 1:bd_col
            slicex = get_board_slice(board, shape, row, column);
            if isempty(slicex)
                continue;
            end
           
            [fitx, scorex] = try_fit(slicex, shape);
            if (fitx == 1&&(scorex >= score))
                best_row = row;
                best_col = column;
                fits = fitx;
                score = scorex;
            end
        end
    end
end

function[fits, row, column, rotations] = find_best_place(board, shape)
    fits = 0;
    row = 0;
    column = 0;
    rotations = 0;
    best_score = -1;
   
    for rots = 0:3
        x_shape = rot90(shape, -rots);
        [x_fits, x_row, x_column, x_score] = find_best_place_for_rotation(board, x_shape);
        if x_fits && x_score > best_score
            row = x_row;
            column = x_column;
            rotations = rots;
            best_score = x_score;
            fits = x_fits
        end
    end
end

function [fits, row, column, best_rotation] = find_best_place(board,shape)
    [rH, cB] = size(board);
    [rot0_fits, rot0_row, rot0_column, rot0_fit_score] = find_best_place_for_rotation(board,shape);
    [rot1_fits, rot1_row, rot1_column, rot1_fit_score] = find_best_place_for_rotation(board,rot90(shape,-1));
    [rot2_fits, rot2_row, rot2_column, rot2_fit_score] = find_best_place_for_rotation(board,rot90(shape,-2));
    [rot3_fits, rot3_row, rot3_column, rot3_fit_score] = find_best_place_for_rotation(board,rot90(shape,-3));
    if rot0_fits == 0 && rot1_fits == 0 && rot2_fits == 0 && rot3_fits == 0
        fits = false;
        row = 1;
        column = 1;
        best_rotation = 0;
       return
    end
    rot0 = [rot0_fits, rot0_row, rot0_column, rot0_fit_score];
    rot1 = [rot1_fits, rot1_row, rot1_column, rot1_fit_score];
    rot2 = [rot2_fits, rot2_row, rot2_column, rot2_fit_score];
    rot3 = [rot3_fits, rot3_row, rot3_column, rot3_fit_score];
    [scores, index] = max([rot0_fit_score, rot1_fit_score, rot2_fit_score, rot3_fit_score]);
    switch index
        case 1
            fits = rot0_fits;
            row = rot0_row;
            column = rot0_column;
            best_rotation = 0;
        case 2
            fits = rot1_fits;
            row = rot1_row;
            column = rot1_column;
            best_rotation = 1;
        case 3
            fits = rot2_fits;
            row = rot2_row;
            column = rot2_column;
            best_rotation = 2;
        case 4
            fits = rot3_fits;
            row = rot3_row;
            column = rot3_column;
            best_rotation = 3;
    end
end