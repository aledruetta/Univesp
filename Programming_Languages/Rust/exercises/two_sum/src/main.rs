fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let mut res: Vec<i32> = vec![];
    let mut index1: usize = 0;
    let mut slice = &nums[..];

    while slice.len() >= 2 {
        let diff = target - slice[0];
        slice = &nums[index1 + 1..];
        if slice.contains(&diff) {
            let index2 = slice.iter().position(|&x| x == diff).unwrap() + index1 + 1;
            res.push(index1 as i32);
            res.push(index2 as i32);
            break;
        }
        index1 += 1;
    }

    res
}

fn main() {
    println!("{:?}", two_sum(vec![2, 7, 11, 15], 9));
    println!("{:?}", two_sum(vec![3, 2, 4], 6));
    println!("{:?}", two_sum(vec![3, 3], 6));
}
