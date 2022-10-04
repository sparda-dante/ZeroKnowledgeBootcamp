## I AM DONE

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

## Implement a function that sums even numbers from the provided array 
func sum_even{bitwise_ptr : BitwiseBuiltin*}(arr_len : felt, arr : felt*, run : felt, idx : felt) -> (sum : felt){
    
    alloc_locals;

    // check arr_len

    if (arr_len == 0) {
        return (sum = 0);
    }
    
    let (even_check) = bitwise_xor(arr[idx], 1); 

    // sum calculation

    let (current_sum) = sum_even(arr_len, arr, run, idx + 1);

    let temp_sum = current_sum + even_check*arr[idx];

    return( sum = temp_sum)
}
