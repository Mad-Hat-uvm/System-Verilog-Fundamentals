//Static class methods
class static_methods_class;

    static int class_id=0;
    int dest_id = 0;

    static function int print_id();
        class_id++;
        $display("Inside static function print_id");
        return clas_id;
    endfunction

    function int get_dest(int dest);
        dest_id = dest;
        $display("Inside function get_dest");
        return dest_id;
    endfunction

endclass

module static_methods_test;

    initial begin
        int id = static_methods_class::print_id();
        $display ("id is: %0d", id);
    end
endmodule