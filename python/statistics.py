class StatisticsCalculator:
    def __init__(self, data):
        self.data = data

    def mean(self):
        return sum(self.data) / len(self.data)

    def median(self):
        sorted_data = sorted(self.data)
        n = len(sorted_data)
        mid = n // 2
        if n % 2 == 0:
            return (sorted_data[mid - 1] + sorted_data[mid]) / 2
        return sorted_data[mid]

    def mode(self):
        frequency = {}
        for num in self.data:
            frequency[num] = frequency.get(num, 0) + 1
        max_count = max(frequency.values())
        return [k for k, v in frequency.items() if v == max_count]


if __name__ == "__main__":
    data = [1, 2, 2, 3, 4, 5, 5, 5,6, 7, 8, 9]
    calc = StatisticsCalculator(data)

    print("Mean:", calc.mean())
    print("Median:", calc.median())
    print("Mode(s):", calc.mode())
