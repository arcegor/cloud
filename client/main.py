import os
import sys
import time


def main():
    while True:
        time.sleep(10.)
        print("Working")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
    try:
        sys.exit(0)
    except SystemExit:
        os._exit(0)
