function piece_shape = get_shape(letter)
if letter == 'I'
    piece_shape = ['I';'I';'I';'I'];
elseif letter == 'J'
    piece_shape = ['J','J','J';' ',' ','J'];
elseif letter == 'L'
    piece_shape = [' ',' ','L';'L','L','L'];
elseif letter == 'O'
    piece_shape = ['O','O';'O','O'];
elseif letter == 'S'
    piece_shape = [' ','S','S';'S','S',' '];
elseif letter == 'T'
    piece_shape = ['T','T','T';' ','T',' '];
elseif letter == 'Z'
    piece_shape = ['Z','Z',' ';' ','Z','Z'];
else
    piece_shape = [];
    end
end