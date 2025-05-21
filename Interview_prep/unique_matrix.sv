/* Generate a 2D matrix with constraints:
**Problem:** Randomize a 3x3 matrix such that:
- All values are unique
- All values are less than 20 */

class unique_matrix;
  rand bit [4:0] mat[3][3];

  constraint unique_values {
    foreach (mat[i, j])
      foreach (mat[k, l])
      if((i != k) || (j != l)) mat[i][j] != mat[k][l]
  }

  constraint max_limit {
    foreach(mat[i, j]) mat[i][j] < 20;
  }

  function void display();
    foreach(mat[i, j])
      $display("mat[%0d][%0d] = %0d", i, j, mat[i][j]);
  endfunction
endclass