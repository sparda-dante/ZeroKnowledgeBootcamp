## I AM NOT DONE

## Return summation of every number below and up to including n
func calculate_sum(n : felt) -> (sum : felt){
    if (n == 0) {
        return (sum=0);
    }

    let (sum) = compute_sum(n=n - 1);
    let sum_and_n = sum + n;
    return (sum=sum_and_n);
}

