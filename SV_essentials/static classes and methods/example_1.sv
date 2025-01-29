class Car;
    static int totalCars;  //STATIC property

    //Constructor
    function new();
        incrementTotalCars();
    endfunction

    static function void incrementTotalCars();
        totalCars++;
    endfunction

    static function int getTotalCars();
        return totalCars;
    endfunction

endclass

module test;
    initial begin
        Car c1 = new();
        Car c2 = new();
        Car c3 = new();

        $display("Total Cars: %0d", Car::getTotalCars());
    end
endmodule
