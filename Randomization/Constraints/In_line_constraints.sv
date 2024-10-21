In-Line Constraints
class consBlock;

    rand bit [1:0] a;
    
    constraint cons_a { a inside {0, 1, 2};}
endclass

initial begin

consBlock rc;

rc = new();

rc.randomize() with {a<2;}; // "a" takes values 0 or 1, this is added to existing constraint.

$display("a: %0d", rc.a);

rc.cons_a.constraint_mode(0);//If you want to write new constraint first disable existing constraint and write new one.

rc.randomize() with {a == 3;};

$display("a: %0d", rc.a);

end

