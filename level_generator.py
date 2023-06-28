import os
import csv
import random
import sys

random.seed(1337)

def main():
    csv.field_size_limit(100000000)
    
    with open('./assets/data/WELFake_Dataset.csv', encoding="utf8") as csvfile:
        reader = csv.reader(csvfile)
        # i = 0
        
        fake_articles = []
        real_articles = []
        
        next(reader)
        
        for row in reader:
            # print(row)
            # i = i + 1
            # if i > 5: break
            
            if row[3] == '0':
                fake_articles.append(row)
            if row[3] == '1':
                real_articles.append(row)
        
        print(f"Real articles: {len(real_articles)}")
        print(f"Fake articles: {len(fake_articles)}")
        
        random.shuffle(fake_articles)
        random.shuffle(real_articles)

        for fake_factor in range(10, 100, 10):
            print(f"Genrating levels for factor {fake_factor}")
            for level_number in range (1, 13):
                print(f"Genrating level {level_number}")
                # Generate level list
                current_level = []
                
                for i in range(int(20 * (float(fake_factor) / 100))):
                    current_level.append(fake_articles[0])
                    fake_articles.pop(0)
                for i in range(int(20 * ((100 - float(fake_factor)) / 100))):
                    current_level.append(real_articles[0])
                    real_articles.pop(0)
                
                # Shuffle level
                random.shuffle(current_level)

                with open(f"./assets/level_data/percentage_{fake_factor}_level_{level_number}.csv", "w", encoding="utf8") as newlevel:
                    writer = csv.writer(newlevel)
                    writer.writerow(['', 'title', 'text', 'label'])
                    writer.writerows(current_level)
                

if __name__ == '__main__':
    main()
    