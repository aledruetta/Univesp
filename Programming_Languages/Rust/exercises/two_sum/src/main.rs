fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let len = nums.len();
    let mut res: Vec<i32> = vec![];

    'outer: for n in 0..len {
        for m in (n + 1)..len {
            if nums[n] + nums[m] == target {
                res.push(n as i32);
                res.push(m as i32);

                break 'outer;
            }
        }
    }

    res
}

fn main() {
    println!("{:?}", two_sum(vec![2, 7, 11, 15], 9));
}
