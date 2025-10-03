def main():
    print_squere(3)


def print_squere(size):
    for i in range(size):
        print_row(size)


def print_row(width):
    print("#" * width)


main()
