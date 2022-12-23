procedure TEST is

    COLUMN_MAX : constant := 10;
    ROW_MAX : constant := COLUMN_MAX;
    type COLUMN_INDEX is range 1..COLUMN_MAX;
    type ROW_INDEX is range 1..ROW_MAX;
    type MATRIX is array(COLUMN_INDEX, ROW_INDEX) of INTEGER;
    
    A : MATRIX;
    I : INTEGER;
    
    procedure INIT_MATRIX(X : in INTEGER; Y : out MATRIX) is

        I, J : INTEGER;

        begin
        I := 1;
        while I <= COLUMN_MAX loop
            J := 1;
            while J <= ROW_MAX loop
                Y(I, J) := X;
                J := J + 1;
                end loop;
            I := I + 1;
            end loop;
        end INIT_MATRIX;

    begin
    I := 1;
    INIT_MATRIX(I, A);
    end TEST;