function board = run_game
  %{
  Runs a tetromino packing from start to finish.  A random shape is
  generated, and then fit into the current board.  The shape will be
  animated as it rotates into the correct configuration.  This will
  continue until the board is filled up.  The final board state is
  returned upon completion.
  Parameters:
    none
  Returns:
    board (character matrix)
  %}
  letters = 'IJLOSTZ';
  board = make_board(22, 10);
  game_figure = figure("Name", "Game Board", "NumberTitle", "off");

  while true
    shape = get_shape(letters(randi(7)));
    [fits row column rotations] = find_best_place(board, shape);

    if ~fits break, end

    draw_and_wait(place_shape(board, shape, 1, 1), game_figure);
    for i = 1:rotations
      shape = rot90(shape, -1);
      draw_and_wait(place_shape(board, shape, 1, 1), game_figure);
    end

    board = place_shape(board, shape, row, column);
    draw_and_wait(board, game_figure);
  end
end

function draw_and_wait(board, game_figure)
    draw_game_board(board, game_figure);
    pause(0.3);
end
