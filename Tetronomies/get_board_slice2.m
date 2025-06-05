function make = get_board_slice(board, shape, row, col)
    %{
    Draw a test board will a tetrominoe. Useful for ensuring that
    it draws is probrably implemented.
    Parameters:
        board
        shape
        columns
    Returns:
        slice
    %}
    for i = row:row+slice(shape)-1
    for j = col:row+slice(shape,2)-1
    make(i-row+1,j-col+1) = board(i,j);
end
end

    
    
end
    