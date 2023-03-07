import torch

class SlidingWindowDataset(torch.utils.data.Dataset):
    # TODO: can we make it faster ? Don't remember how __getitem__ works...
    def __init__(self, data, window):
        self.data = data # number of featues x time series length
        self.window = min(window, data.shape[1]-1)

    def __getitem__(self, index):
        x = self.data[:, index: index + self.window]
        y = self.data[:, index + self.window + 1]
        return x, y

    def __len__(self):
        return self.data.shape[1] - (self.window + 1)
