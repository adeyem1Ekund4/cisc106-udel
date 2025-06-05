function [slice_end,x1,y1] = get_board_slice(board, shape, row, column)
[x1, y1] = size(shape);
[x2, y2] = size(board);
x1 = (row + (x1 - 1));
y1 = (column + (y1 -1));
if (x1 > x2 | y1 > y2))
    slice_end = [];
else
    slice_end = board(row:x1, column:y1);
    end   
end

