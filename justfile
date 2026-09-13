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

test-exercise EXERCISE:
    cd gleam/{{ EXERCISE }} && gleam test

check: lint test

update:
    for dir in gleam/*/; do (cd "$dir" && gleam deps update); done
