default:
    @just --list

install:
    gleam --version

format:
    for dir in gleam/*/; do (cd "$dir" && gleam format); done

lint:
    for dir in gleam/*/; do (cd "$dir" && gleam format --check); done

test:
    for dir in gleam/*/; do (cd "$dir" && gleam test); done

check: lint test

update:
    for dir in gleam/*/; do (cd "$dir" && gleam deps update); done

solve exercise:
    cd gleam/{{ exercise }} && gleam test
