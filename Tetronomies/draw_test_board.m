function draw_test_board
  %{
  Draws a test board with all seven tetrominoes.  Useful for
  ensuring that draw_game_board is properly implemented.
  Parameters:
    none
  Returns:
    nothing
  %}
  test_figure = figure("Name", "A Test for draw_game_board", "NumberTitle", "off");
  test_board = ['O' 'O' ' ' ' ' ' ' 'L';
                'O' 'O' ' ' 'L' 'L' 'L';
                ' ' ' ' ' ' ' ' ' ' ' ';
                'J' ' ' ' ' ' ' ' ' 'Z';
                'J' 'J' 'J' ' ' 'Z' 'Z';
                ' ' ' ' ' ' ' ' 'Z' ' ';
                ' ' 'S' 'S' ' ' ' ' 'T';
                'S' 'S' ' ' ' ' 'T' 'T';
                ' ' ' ' ' ' ' ' ' ' 'T';
                'I' 'I' 'I' 'I' ' ' ' '];
  draw_game_board(test_board, test_figure);
end
