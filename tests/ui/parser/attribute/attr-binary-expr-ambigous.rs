//@ run-rustfix
#![feature(stmt_expr_attributes)]
#![allow(unused_assignments, unused_attributes)]

fn main() {
    let mut x = #[deprecated] 1 + 2; //~ ERROR ambiguous

    #[deprecated] x = 4; //~ ERROR ambiguous

    x = #[deprecated] 5 as i32; //~ ERROR ambiguous

    let _r = #[deprecated] 1..6; //~ ERROR ambiguous

    println!("{}", x);
}
