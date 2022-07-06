import torch


def main():
    x = torch.empty(100, 100)
    if torch.cuda.is_available():
        print('CUDA: YES)')
        x = x.cuda()
    else:
        print('CUDA: NO(')


if __name__ == '__main__':
    main()
