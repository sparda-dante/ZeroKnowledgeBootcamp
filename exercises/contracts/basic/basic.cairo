// [StarkNet](https://starkware.co/product/starknet/) is a permissionless decentralized ZK-Rollup operating
// as an L2 network over Ethereum, where any dApp can achieve
// unlimited scale for its computation, without compromising
// Ethereum's composability and security.
//
// This is a simple StarkNet contract.
// Note that you won't be able to use the playground to compile and run it,
// but you can deploy it on the [StarkNet Planets Alpha network](https://medium.com/starkware/starknet-planets-alpha-on-ropsten-e7494929cb95)!
//
// 1. Click on "Deploy" to deploy the contract.
//    For more information on how to write Cairo contracts see the
//    ["Hello StarkNet" tutorial](https://cairo-lang.org/docs/hello_starknet).
// 2. Click on the contract address in the output pane to open
//    [Voyager](https://goerli.voyager.online/) - the StarkNet block explorer.
// 3. Wait for the page to load the information
//    (it may take a few minutes until a block is created).
// 4. In the "STATE" tab, you can call the "add()" transaction.

// The "%lang" directive declares this code as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.cairo.common.uint256 import Uint256, uint256_le, uint256_unsigned_div_rem, uint256_sub
from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.math import unsigned_div_rem, assert_le_felt, assert_le
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor

struct Sale_Details{
     price: felt,
     item_index: felt, 
     discount_applied: felt,
}

// Variables which are stored on-chain and persist between invocations are prefaced with @storage_var
@storage_var
func total_customers() -> (idx : felt){
}

// Storage index can be composed of multiple values, they can point to a struct too
@storage_var
func sales(buyer : felt, seller : felt, transaction : felt) -> (sale_details : Sale_Details){
}

@view
func total_customers_now{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (tc : felt){
    let (tc) = total_customers.read();
    return (tc,);
}

@external
func submit_sale{pedersen_ptr : HashBuiltin*, syscall_ptr : felt*, range_check_ptr}(price : felt, item_index : felt, discount_applied : felt, buyer : felt, seller : felt, transaction : felt){
    
    alloc_locals;
    // Variables must be instantiated with either let/tempvar/local
    local sale : Sale_Details = Sale_Details(price, item_index, discount_applied);

    // Write sale date
    sales.write(buyer, seller, transaction, sale);

    // Get transaction counter
    let (tc) = total_customers.read();

    // Increment transaction counter
    total_customers.write(tc+1);

    // Functions must always return something  
    return ();
}


