function draw_test_board
    %{
    Draw a test board will all seven tetrominoes. Useful for ensuring that
    it draws is probrably implemented.
    Parameters:
        none
    Returns:
        none
    %}
    test_figure = figure("Name", "A test for draw_game_board", "NumberTitle", "off");
    test_figure = ['O' 'O' ' ' ' ' ' ' 'L';
                   'O' 'O' ' ' 'L' 'L' 'L';
                   ' ' ' ' ' ' ' ' ' ' ' ';
                   'J' 'O' ' ' ' ' ' ' 'Z';
                   'J' 'J' 'J' ' ' 'Z' 'Z';
                   ' ' ' ' ' ' ' ' 'Z' ' ';
                   ' ' 'S' 'S' ' ' ' ' 'T';
                   'S' 'S' ' ' ' ' 'T' 'T';
                   ' ' ' ' ' ' ' ' ' ' 'T';
                   'I' 'I' 'I' 'I' ' ' ' ';]
                   
    draw_game_board(testboard, test_figure);
end
                    

    
    