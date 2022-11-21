fn main() {
    let _ch = 'A';

    let slice_s = "Slice String";
    println!("{slice_s}");

    let mut string = String::new();
    string.push_str(slice_s);
    println!("{string}");

    let string = slice_s.to_string();
    println!("{string}");

    let string = String::from(slice_s);
    println!("{string}");

    let arr_str = ['a', 'b', 'c'];
    let string = String::from_iter(arr_str);
    println!("{string}");

    let string: String = slice_s.into();
    println!("{string}");

    let string: String = slice_s.to_owned();
    println!("{string}");
}
