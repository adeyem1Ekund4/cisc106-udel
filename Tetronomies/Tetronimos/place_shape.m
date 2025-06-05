function new_board = place_shape(board, shape, row, column)
   [slice_end, x1, y1] = get_board_slice(board, shape, row, column);
   slice_end(slice_end == ' ') = shape(shape ~= ' ');
   board(row:x1, column:y1) = slice_end;
end

