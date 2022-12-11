use std::collections::HashSet;
use std::fs;
use std::io::{self, BufRead};
use std::fmt::Display;
use std::str::FromStr;

fn main() {
    let days = [day1, day2, day3, day4];
    for (n, day) in days.iter().enumerate() {
        let output = day();
        println!("Day {:2}: {:60} {:60}", 1 + n, output.p1, output.p2)
    }
}

struct Output {
    p1: Box<dyn Display>,
    p2: Box<dyn Display>,
}

impl Output {
    fn new(p1: impl Display + 'static, p2: impl Display + 'static) -> Output {
        Output { p1: Box::new(p1), p2: Box::new(p2) }
    }
}

fn day1() -> Output {
    let reader = io::BufReader::new(fs::File::open("1.input").expect("Cannot open file"));
    let mut elves = Vec::new();
    let mut acc = 0;
    for line in reader.lines() {
        let line = line.unwrap();
        if line.is_empty() {
            elves.push(acc);
            acc = 0;
        } else {
            acc += i64::from_str_radix(&line, 10).unwrap();
        }
    }
    elves.push(acc);

    elves.sort();
    let p1 = *elves.last().unwrap();
    let p2: i64 = elves.iter().rev().take(3).sum::<i64>();
    Output::new(p1, p2)
}

fn day2() -> Output {
    #[derive(Copy, Clone, PartialEq, Eq, Debug)]
    enum Move { Rock = 1, Paper = 2, Scissors = 3 }
    #[derive(Copy, Clone, PartialEq, Eq, Debug)]
    enum Score { Win = 6, Loss = 0, Draw = 3 }
    impl Move {
        fn from_char(c: char) -> Option<Move> {
            match c {
                'A' | 'X' => Some(Move::Rock),
                'B' | 'Y' => Some(Move::Paper),
                'C' | 'Z' => Some(Move::Scissors),
                _ => None
            }
        }

        fn play(self, other: Move) -> Score {
            match (self, other) {
                (Move::Rock, Move::Paper) |
                (Move::Paper, Move::Scissors) |
                (Move::Scissors, Move::Rock) => Score::Win,
                (x, y) if x == y => Score::Draw,
                _ => Score::Loss,
            }
        }

        fn wins(&self) -> Move {
            match *self {
                Move::Rock => Move::Paper,
                Move::Paper => Move::Scissors,
                Move::Scissors => Move::Rock
            }
        }

        fn loses(&self) -> Move {
            self.wins().wins()
        }
    }

    impl std::ops::Add<Score> for Move {
        type Output = usize;
        fn add(self, other: Score) -> usize {
            other as usize + self as usize
        }
    }

    impl std::ops::Add<Move> for Score {
        type Output = usize;
        fn add(self, other: Move) -> usize {
            other as usize + self as usize
        }
    }

    let mut p1 = 0;
    let mut p2 = 0;
    for line in io::BufReader::new(fs::File::open("2.input").expect("cannot open file")).lines() {
        let line = line.unwrap();
        let mut chars = line.chars();

        let elf = Move::from_char(chars.next().unwrap()).unwrap();
        chars.next(); // skip the space
        let c = chars.next().unwrap();
        let you = Move::from_char(c).unwrap();
        p1 += elf.play(you) + you;
        p2 += match c {
            'X' => elf.loses() + Score::Loss,
            'Y' => elf + Score::Draw,
            'Z' => elf.wins() + Score::Win,
            _ => 0,
        };
    }

    Output::new(p1, p2)
}

fn day3() -> Output {
    let lines: Vec<String> = io::BufReader::new(fs::File::open("3.input").unwrap()).lines().collect::<Result<_, _>>().unwrap();
    fn h(c: &str) -> HashSet<char> { c.chars().collect() }
    fn s(set: HashSet<char>) -> u32 {
        match set.iter().next() {
            Some(c @ 'a'..='z') => 1 + (*c as u32) - ('a' as u32),
            Some(c @ 'A'..='Z') => 27 + (*c as u32) - ('A' as u32),
            _ => 0
        }
    }
    let p1: u32 = lines.iter()
        .map(|s| s.split_at(s.len() / 2))
        .map(|(a, b)| h(a).intersection(&h(b)).copied().collect())
        .map(s)
        .sum();

    let p2: u32 = lines.chunks_exact(3)
        .map(|c| c.iter()
            .map(|s| h(s))
            .reduce(|a, b| a.intersection(&b).copied().collect()).unwrap())
        .map(s)
        .sum();

    Output::new(p1, p2)
}

fn day4() -> Output {
    struct Range {
        start: u32,
        end: u32
    }
    impl Range {
        fn new(start: u32, end: u32) -> Range { Range { start, end } }
        fn contains(&self, other: &Range) -> bool {
            self.start <= other.start && self.end >= other.end
        }
        fn overlaps(&self, other: &Range) -> bool {
            self.start <= other.start && other.start <= self.end
        }
    }

    let ranges: Vec<(Range, Range)> = io::BufReader::new(fs::File::open("4.input").unwrap())
        .lines()
        .filter_map(|line| {
            let nums = line.ok()?.split(|c| ",-".contains(c)).map(u32::from_str).collect::<Result<Vec<_>, _>>().ok()?;
            Some((Range::new(nums[0], nums[1]), Range::new(nums[2], nums[3])))
        }).collect();

    let p1 = ranges.iter().filter(|(a, b)| a.contains(b) || b.contains(a)).count();
    let p2 = ranges.iter().filter(|(a, b)| a.overlaps(b) || b.overlaps(a)).count();
    Output::new(p1, p2)
}

fn day5() -> Output {
    let mut lines = io::BufReader::new(fs::File::open("5.input").unwrap()).lines();
    
    Output::new(0, 0)
}
