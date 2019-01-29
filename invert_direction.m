function x = invert_direction(direction)
    x = direction + 2;
    if (x > 4)
        x = x - 4;
    end
end