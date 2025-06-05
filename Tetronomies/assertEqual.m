function []=assertEqual(x, y)
%modified by Amer  11-15-2011
%   removed count of successes, failures
%   included assert test for success case
%   modified output messages
    persistent success
    persistent failure
    persistent last_file
    persistent last_file_line
        
    [stack] = dbstack();
    %disp(stack(1))    
    line = 0;
    %text = 'SUCCESS';
    file = 'Command Window';
    if length(stack) > 1
        line = stack(2).line;
        file = stack(2).file;
    end
    if ~isequal(file, last_file) || last_file_line >= line 
        last_file = file;
        success = 0;
        failure = 0;
    end
    last_file_line = line;
    
    if req(x, y)
        success = success + 1;
        if length(stack) == 1
            tline = file;
        else
            f = fopen(file);
            tline = fgetl(f);
            t = 1;
            while ischar(tline) && t < line
                tline = fgetl(f);
                t = t + 1;
            end
            fclose(f);
        end
        
        text = sprintf('SUCCESS: %s', strtrim(tline));
    else
        failure = failure + 1;
        if length(stack) == 1
            tline = file;
        else
            f = fopen(file);
            tline = fgetl(f);
            t = 1;
            while ischar(tline) && t < line
                tline = fgetl(f);
                t = t + 1;
            end
            fclose(f);
        end
        
        text = sprintf('FAILURE: %s, \n\t\t actual return value: %s   asserted return value: %s', ...
                strtrim(tline), to_str(x), to_str(y));
    end
    fprintf('%s: line %d: %s\n', file, line, text);
    
    function out=req(x, y)
        out = false;
        if isequal(x, y) 
            out = true;
        elseif (isnumeric(x) && isnumeric(y))
            out = 0.0001 > abs(x - y);
            while numel(out) > 1
                out = all(out);
            end
        elseif (isstruct(x) && isstruct(y))
            fields = fieldnames(x);
            %disp(fields)
            out = true;
            for i = 1:length(fields)
                out = out && req(x.(fields{i}), y.(fields{i}));
            end
        end
    end
            
    function strx = to_str(x)
        if isstruct(x)
            values = cellfun(@(z)to_str(z), ...
                [fieldnames(x) cellfun(@(y)x.(y),fieldnames(x), ...
                'UniformOutput',false)]','UniformOutput',false);
            
            strx = ['struct(' sprintf('%s, ', values{1:end-1}) values{end} ')'];
        elseif ischar(x)
            strx = ['''' x ''''];
        else
            strx = num2str(x);
            
            if length(x) > 1
                strx = ['[' regexprep(strx,'(\s*)',', ') ']'];
            end
            
        end
    end
end
