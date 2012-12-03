# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#User.delete_all
#Tag.delete_all
#Sound.delete_all
#SoundTagRelation.delete_all

city_locations = [
    [121.47,31.23],
    [72.82,18.96],
    [67.01,24.86],
    [-58.37,-34.61],
    [77.21,28.67],
    [29,41.1],
    [120.97,14.62],
    [-46.63,-23.53],
    [37.62,55.75],
    [90.39,23.7],
    [126.99,37.56],
    [3.35,6.5],
    [15.32,-4.31],
    [139.77,35.67],
    [-99.14,19.43],
    [106.83,-6.18],
    [-73.94,40.67],
    [51.43,35.67],
    [31.25,30.06],
    [-77.05,-12.07],
    [116.4,39.93],
    [-0.1,51.52],
    [-74.09,4.63],
    [74.35,31.56],
    [-43.2,-22.91],
    [100.5,13.73],
    [44.44,33.33],
    [77.56,12.97],
    [-70.64,-33.46],
    [88.36,22.57],
    [103.85,1.3],
    [-79.38,43.65],
    [96.15,16.79],
    [3.93,7.38],
    [46.77,24.65],
    [80.27,13.09],
    [106.58,29.57],
    [106.69,10.78],
    [108.9,34.27],
    [114.27,30.58],
    [29.95,31.22],
    [30.32,59.93],
    [78.48,17.4],
    [104.07,30.67],
    [-4.03,5.33],
    [32.85,39.93],
    [72.58,23.03],
    [-118.41,34.11],
    [117.2,39.13],
    [91.81,22.33],
    [151.21,-33.87],
    [139.62,35.47],
    [144.96,-37.81],
    [123.45,41.8],
    [18.46,-33.93],
    [13.38,52.52],
    [129.03,35.11],
    [-73.57,45.52],
    [126.65,45.75],
    [30.99,-29.87],
    [31.21,30.01],
    [118.78,32.05],
    [-7.62,33.6],
    [73.84,18.53],
    [38.74,9.03],
    [125.75,39.02],
    [72.82,21.2],
    [-3.71,40.42],
    [113.25,23.12],
    [39.17,21.5],
    [80.33,26.47],
    [36.82,-1.29],
    [75.8,26.92],
    [39.28,-6.82],
    [-38.5,-12.97],
    [-87.68,41.84],
    [112.55,37.87],
    [43.14,36.34],
    [73.11,31.41],
    [125.35,43.87],
    [27.15,38.43],
    [121.45,25.02],
    [135.5,34.68],
    [80.92,26.85],
    [30.52,50.43],
    [13.24,-8.82],
    [126.64,37.48],
    [12.5,41.89],
    [-17.48,14.72],
    [-43.94,-19.92],
    [-38.59,-3.78],
    [59.57,36.27],
    [-71.66,10.73],
    [69.17,34.53],
    [-69.91,18.48],
    [128.6,35.87],
    [-47.91,-15.78],
    [32.48,15.65],
    [79.08,21.16],
    [112.74,-7.24],
    [8.52,12],
    [-75.54,6.29],
    [-0.2,5.56],
    [136.91,35.15],
    [5.62,6.34],
    [114.48,38.05],
    [-79.9,-2.21],
    [112.97,28.2],
    [-95.39,29.77],
    [32.52,15.58],
    [2.34,48.86],
    [-76.52,3.44],
    [3.04,36.77],
    [117,36.67],
    [-82.39,23.13],
    [69.3,41.31],
    [121.65,38.92],
    [126.55,43.85],
    [115.88,28.68],
    [113.67,34.75],
    [-123.13,49.28],
    [28.04,-26.19],
    [35.5,33.89],
    [9.71,4.06],
    [114.17,22.32],
    [-66.93,10.54],
    [7.44,10.52],
    [26.1,44.44],
    [-99.05,19.6],
    [141.34,43.06],
    [7.01,4.81],
    [120.17,30.25],
    [73.04,33.6],
    [44.21,15.38],
    [-13.67,9.55],
    [-49.29,-25.42],
    [47.82,30.53],
    [153.02,-27.46],
    [114.07,32.13],
    [98.67,3.59],
    [75.86,22.72],
    [-60.02,-3.12],
    [-1.63,6.69],
    [10,53.55],
    [-6.84,34.02],
    [27.55,53.91],
    [85.13,25.62],
    [-67.98,10.23],
    [77.4,23.24],
    [27.84,-26.28],
    [21.02,52.26],
    [120.32,36.07],
    [16.37,48.22],
    [11.52,3.87],
    [55.33,25.27],
    [72.97,19.2],
    [37.17,36.23],
    [106.97,-6.22],
    [19.08,47.51],
    [-7.99,12.65],
    [75.84,30.91],
    [31.05,-17.82],
    [51.68,32.68],
    [28.22,-25.73],
    [2.17,41.4],
    [27.48,-11.66],
    [107.6,-6.91],
    [-103.35,20.67],
    [118.19,39.62],
    [45.33,2.05],
    [-112.07,33.54],
    [36.32,33.5],
    [-78.5,-0.19],
    [78.01,27.19],
    [87.58,43.8],
    [125.63,7.11],
    [-63.21,-17.77],
    [47.51,-18.89],
    [135.17,34.68],
    [-106.49,31.74],
    [-117.02,32.53],
    [-34.92,-8.08],
    [71.45,30.2],
    [105.84,21.03],
    [120.27,22.63],
    [-48.5,-1.44],
    [-64.19,-31.4],
    [32.58,0.32],
    [1.35,6.17],
    [68.37,25.38],
    [120.62,31.3],
    [73.18,22.31],
    [74.18,32.16],
    [29.08,40.2],
    [23.59,-6.13],
    [73.8,18.62],
    [50.97,35.8],
    [135.75,35.01],
    [106.63,-6.18],
    [7.35,5.1],
    [36.22,49.98],
    [-98.22,19.05],
    [73.78,20.01],
    [101.71,3.16],
    [-75.13,40.01],
    [130.41,33.59],
    [127.43,36.33],
    [103.68,36.05],
    [39.82,21.43],
    [116.67,23.37],
    [126.93,37.7],
    [117.28,31.85],
    [82.93,55.04],
    [-51.22,-30.04],
    [35.32,37],
    [119.41,-5.14],
    [46.3,38.08],
    [90.5,23.62],
    [77.3,28.38],
    [123.88,41.87],
    [104.92,11.57],
    [112.47,34.68],
    [89.56,22.84],
    [106.83,-6.39],
    [28.29,-15.42],
    [77.41,28.66],
    [114.48,36.58],
    [-98.51,29.46],
    [139.7,35.53],
    [126.91,35.16],
    [71.54,34.01],
    [70.79,22.31],
    [127.01,37.26],
    [96.09,21.98],
    [76.92,43.32],
    [11.58,48.14],
    [77.7,28.99],
    [110.05,40.6],
    [9.19,45.48],
    [116.34,23.54],
    [73.16,19.25],
    [-56.17,-34.87],
    [114.14,22.27],
    [60.6,56.85],
    [-1.53,12.37],
    [-46.49,-23.46],
    [110.42,-6.97],
    [117.18,34.27],
    [115.84,-31.96],
    [-96.77,32.79],
    [18.07,59.33],
    [104.75,-2.99],
    [-117.14,32.81],
    [-49.26,-16.72],
    [37.39,37.07],
    [44,56.33],
    [52.57,29.63],
    [-60.67,-32.94],
    [119.3,26.08],
    [-99.03,19.41],
    [139.64,35.87],
    [114.13,22.53],
    [44.52,40.17],
    [13.18,32.87],
    [122.95,41.12],
    [83.01,25.32],
    [106.72,26.58],
    [49.86,40.39],
    [120.3,31.58],
    [14.43,50.08],
    [15.26,-4.25],
    [101.53,3.15],
    [-101.69,21.12],
    [132.44,34.39],
    [74.87,31.64],
    [116.98,32.63],
    [-74.8,10.96],
    [-10.8,6.31],
    [35.93,31.95],
    [44.79,41.72],
    [7.49,9.06],
    [75.32,19.89],
    [23.31,42.69],
    [73.4,55],
    [-100.32,25.67],
    [25.59,-33.96],
    [73.06,19.11],
    [32.57,-25.95],
    [81.84,25.45],
    [50.15,53.2],
    [20.5,44.83],
    [-47.08,-22.91],
    [75.89,17.67],
    [49.13,55.75],
    [44.01,36.18],
    [-69.3,10.05],
    [12.58,55.67],
    [108.7,34.37],
    [115.48,38.87],
    [-90.55,14.63],
    [-35.75,-9.65],
    [-43.47,-22.74],
    [102.7,25.05],
    [120.68,24.15],
    [13.16,11.85],
    [113.3,40.08],
    [-6.25,53.33],
    [79.94,23.17],
    [83.3,17.73],
    [39.71,47.24],
    [34.98,48.45],
    [31.25,30.11],
    [74.79,34.09],
    [123.75,41.33],
    [4.33,50.83],
    [39.59,24.48],
    [138.6,-34.93],
    [-103.4,20.72],
    [61.43,55.15],
    [88.33,22.58],
    [-114.06,51.05],
    [140.89,38.26],
    [-87.22,14.09],
    [85.33,23.36],
    [127.15,37.44],
    [4.55,8.49],
    [-5,34.05],
    [56.04,54.78],
    [101.45,3.04],
    [76.78,30.75],
    [48.72,31.28],
    [76.96,11.01],
    [6.97,50.95],
    [50.95,34.65],
    [30.73,46.47],
    [37.82,48],
    [73.02,26.29],
    [-44.3,-2.5],
    [-43.07,-22.84],
    [130.86,33.88],
    [116.75,33.95],
    [56.25,58],
    [119.97,31.78],
    [76.65,12.31],
    [91.75,26.19],
    [44.48,48.71],
    [32.48,37.88],
    [14.27,40.85],
    [80.63,16.52],
    [129.31,35.55],
    [-121.85,37.3],
    [-1.91,52.48],
    [140.11,35.61],
    [-62.62,8.37],
    [25.66,-10.7],
    [100.35,-0.95],
    [-86.27,12.15],
    [-68.83,-32.89],
    [78.17,26.23],
    [74.57,42.87],
    [85.31,27.71],
    [-68.17,-16.5],
    [2.12,13.52],
    [30.06,-1.94],
    [124,47.35],
    [106.91,47.93],
    [93.06,56.02],
    [78.12,9.92],
    [-113.54,53.57],
    [58.38,37.95],
    [32.52,15.64],
    [-71.53,-16.39],
    [-8,31.63],
    [105.27,-5.44],
    [113.3,33.73],
    [-75.5,10.4],
    [75.13,15.36],
    [-68.15,-16.5],
    [120.65,28.02],
    [-75.71,45.42],
    [103.75,1.48],
    [39.66,-4.04],
    [33.8,-13.97],
    [7.68,45.08],
    [-43.31,-22.77],
    [54.37,24.48],
    [75.57,31.33],
    [5.76,5.52],
    [-0.39,39.48],
    [10.75,59.91],
    [117.12,36.2],
    [50.1,26.43],
    [72.85,19.29],
    [78.16,11.67],
    [30.39,-29.61],
    [-99.23,19.48],
    [36.72,34.73],
    [85.84,20.27],
    [137.73,34.72],
    [46.03,51.57],
    [-83.1,42.38],
    [44.39,35.47],
    [135.48,34.57],
    [6.78,6.14],
    [67.02,30.21],
    [78.06,27.89],
    [39.26,51.72],
    [-13.24,8.49],
    [-65.22,-26.83],
    [106.79,-6.58],
    [139.04,37.92],
    [76.95,8.51],
    [-81.66,30.33],
    [79.41,28.36],
    [123.9,10.32],
    [75.83,25.18],
    [-35.22,-5.8],
    [126.89,37.46],
    [126.77,37.48],
    [78.69,10.81],
    [-79.03,-8.11],
    [55.41,25.37],
    [47.06,34.38],
    [119.62,39.93],
    [114.35,36.08],
    [73.05,19.3],
    [44.34,32],
    [-46.54,-23.71],
    [-42.8,-5.1],
    [108.32,22.82],
    [30.71,36.89],
    [-54.63,-20.45],
    [-86.15,39.78],
    [-35.02,-8.11],
    [35.17,47.85],
    [111.64,40.82],
    [5.37,43.31],
    [78.76,28.84],
    [114.93,40.83],
    [109.25,24.28],
    [-15.98,18.09],
    [88.59,24.37],
    [121.4,37.53],
    [120.19,23],
    [101.77,36.62],
    [-72.34,18.54],
    [130.37,47.4],
    [5.19,7.25],
    [15.05,12.11],
    [-100.26,25.68],
    [19.96,50.06],
    [112.62,-7.98],
    [112.62,26.89],
    [23.73,37.98],
    [114.98,35.7],
    [-122.45,37.77],
    [35.22,31.78],
    [4.89,52.37],
    [19.46,51.77],
    [-89.62,20.97],
    [-97.75,30.31],
    [3.35,7.16],
    [113.87,35.32],
    [81.63,21.24],
    [10.22,36.84],
    [-82.99,39.99],
    [-106.08,28.63],
    [24,49.83],
    [2.44,6.36],
    [101.43,0.56],
    [34.99,-15.79],
    [-57.96,-34.92],
    [28.58,-20.17],
    [-5.81,35.79],
    [35.48,38.74],
    [49.51,53.48],
    [113.12,23.03],
    [121.55,29.88],
    [116.68,39.52],
    [101.77,3.15],
    [123.18,41.28],
    [24.13,56.97],
    [111.75,35.22],
    [33.35,47.92],
    [9.45,0.39],
    [127.14,35.83],
    [-97.34,32.75],
    [45.43,35.56],
    [-46.78,-23.53],
    [122.08,6.92],
    [-99.19,19.54],
    [83.36,26.76],
    [-100.98,22.16],
    [-5.98,37.4],
    [113.15,27.83],
    [15.97,45.8],
    [115.1,30.22],
    [-70.57,-33.61],
    [113.58,24.8],
    [32.46,-25.97],
    [110.28,25.28],
    [-102.3,21.88],
    [138.39,34.98],
    [20.07,32.12],
    [121.65,42.01],
    [-34.86,-7.12],
    [101.07,4.6],
    [-44.1,-19.91],
    [68.78,38.57],
    [110.38,21.2],
    [114.49,37.07],
    [133.92,34.67],
    [110.37,-7.78],
    [81.38,21.21],
    [104.78,29.4],
    [129.6,44.58],
    [-0.62,35.7],
    [7.51,6.44],
    [-46.53,-23.65],
    [79.85,6.93],
    [-98.96,19.44],
    [114.19,22.38],
    [-90.01,35.11],
    [130.71,32.8],
    [-45.88,-23.2],
    [118.06,36.8],
    [-99.92,16.85],
    [112.9,27.85],
    [-71.23,46.82],
    [120.93,14.33],
    [7.71,11.08],
    [120.82,32.02],
    [-80.83,35.2],
    [11.87,-4.77],
    [111.2,27],
    [-100.4,20.59],
    [-79.85,43.26],
    [73.06,33.72],
    [122.05,41.18],
    [-101,25.42],
    [126.86,37.35],
    [86.2,22.79],
    [-0.89,41.65],
    [-86.83,21.17],
    [124.4,40.13],
    [8.68,50.12],
    [13.36,38.12],
    [110.32,20.05],
    [45.03,12.79],
    [77.76,20.95],
    [-97.17,49.88],
    [139.38,35.58],
    [117.67,24.52],
    [34.44,31.53],
    [85.88,20.47],
    [-106.44,31.85],
    [38.98,45.03],
    [110.34,1.55],
    [17.03,51.11],
    [38.94,15.33],
    [119.43,32.22],
    [-76.61,39.3],
    [28.33,-26.15],
    [34.63,36.81],
    [53.23,56.85],
    [120.12,33.39],
    [-110.97,29.07],
    [114.02,22.44],
    [-48.28,-18.9],
    [48.4,54.33],
    [-5.03,7.69],
    [-70.69,19.48],
    [-115.47,32.65],
    [106.68,20.86],
    [126.92,37.39],
    [125.25,6.1],
    [-101.18,19.72],
    [4.56,7.77],
    [127.5,36.64],
    [8.89,9.93],
    [55.74,24.23],
    [-47.47,-23.49],
    [73.32,28.03],
    [119.9,32.49],
    [121.18,14.59],
    [118.08,24.45],
    [-66.17,-17.38],
    [-107.39,24.8],
    [122.28,40.67],
    [130.56,31.59],
    [124.33,43.17],
    [45,37.53],
    [114.65,37.88],
    [40.23,37.92],
    [39.87,57.62],
    [-90.6,14.64],
    [114.59,-3.33],
    [28.83,47.03],
    [43.15,11.59],
    [-122.35,47.62],
    [9.19,48.79],
    [135.12,48.42],
    [4.48,51.93],
    [121.1,41.12],
    [25.19,0.53],
    [-88.03,15.47],
    [117.33,32.95],
    [104.24,52.33],
    [86.03,44.3],
    [-67.47,10.33],
    [-72.51,7.88],
    [72.13,21.79],
    [32.29,31.26],
    [-104.87,39.77],
    [8.93,44.42],
    [113.08,22.58],
    [7.48,51.51],
    [83.75,53.36],
    [-77.02,38.91],
    [-96.14,19.19],
    [-47.8,-21.17],
    [131.9,43.13],
    [-57.58,-38],
    [-71.02,42.34],
    [30.52,39.79],
    [79.58,18.01],
    [60.83,29.5],
    [7,51.47],
    [6.79,51.24],
    [114.35,34.85],
    [-76.8,17.99],
    [-4.27,55.87],
    [139.99,35.7],
    [101.56,3.07],
    [110.87,21.92],
    [139.33,35.66],
    [-5.56,33.9],
    [127.54,39.91],
    [-90.59,14.53],
    [72.67,32.08],
    [-115.22,36.21],
    [49.63,37.3],
    [116.87,38.32],
    [117.67,39],
    [24.94,60.17],
    [-4.42,36.72],
    [-87.97,43.06],
    [-86.78,36.17],
    [4.56,7.48],
    [111.68,29.03],
    [40.38,21.26],
    [110.82,-7.57],
    [16.9,52.4],
    [-64.72,10.13],
    [26.23,-29.15],
    [-99.26,19.57],
    [18.56,4.36],
    [-98.28,26.08],
    [114.25,22.33],
    [-56.09,-15.61],
    [88.42,26.73],
    [-97.51,35.47],
    [-85.74,38.22],
    [130.35,46.83],
    [119.03,33.58],
    [26.73,-27.97],
    [74.22,16.7],
    [73.15,19.23],
    [88.44,22.44],
    [8.81,53.08],
    [-89.19,13.69],
    [118.48,31.73],
    [28.22,-25.99],
    [121.44,25.02],
    [-99.67,19.29],
    [-122.66,45.54],
    [153.44,-28.07],
    [116.07,5.97],
    [25.27,54.7],
    [-9.61,30.42],
    [74.64,26.45],
    [55.1,51.78],
    [105.05,29.58],
    [-65.41,-24.79],
    [80.44,16.31],
    [87.1,53.75],
    [119.43,32.4],
    [87.31,23.5],
    [112.23,30.32],
    [-57.63,-25.3],
    [-49.24,-16.82],
    [-44.08,-19.76],
    [101.62,3.1],
    [74.57,16.86],
    [78.05,30.34],
    [-63.17,9.75],
    [-103.43,25.55],
    [113.22,35.25],
    [113.57,22.28],
    [77.29,19.17],
    [32.54,29.98],
    [65.53,57.15],
    [-106.62,35.12],
    [124.67,8.45],
    [32.89,-2.52],
    [-66.83,10.52],
    [-74.77,10.92],
    [127.04,37.74],
    [113.1,29.38],
    [-38.97,-12.25],
    [44.04,13.6],
    [-110.89,32.2],
    [52.32,55.69],
    [57.08,30.3],
    [132.77,33.84],
    [13.39,9.3],
    [-103.32,20.64],
    [-93.12,16.75],
    [70.07,22.47],
    [74.85,32.71],
    [76.82,17.34],
    [-79.84,-6.76],
    [9.73,52.4],
    [-73.13,7.13],
    [71.67,29.39],
    [12.01,57.72],
    [113.98,22.41],
    [88.42,22.89],
    [39.74,54.62],
    [121.15,14.21],
    [128.62,35.27],
    [-37.07,-10.91],
    [106.92,27.7],
    [39.62,52.62],
    [13.74,51.05],
    [77.54,29.97],
    [36.73,35.15],
    [24.89,12.06],
    [-100.3,25.75],
    [135.59,34.67],
    [44.43,32.48],
    [12.4,51.35],
    [113.82,34.02],
    [118.37,31.35],
    [13.05,-5.85],
    [22.4,-5.89],
    [32,46.97],
    [-84.42,33.76],
    [-51.18,-23.3],
    [36.57,28.39],
    [-99.25,19.65],
    [11.05,49.45],
    [-60.69,-31.6],
    [-48.84,-26.32]
]

def get_location(locations, city_id)
  long = locations[city_id][1]
  lat = locations[city_id][0]

  long_diff = rand(-0.1..0.1)
  lat_diff = rand(-0.1..0.1)
  location = Hash.new
  location["long"] = (long+long_diff)
  location["lat"] = (lat+lat_diff)

  return location
end

####Debug Only#####
local_filename = "/Users/susen/seed_log.txt"
logger = File.open(local_filename, 'w')
debug = true
def log(debug, file, info)
  if debug
    file.write(info+"\n")
  end
end
#########

user_num = 100#5
tag_num = 100#5
sound_num = 1000#20
tn = 5 #every sound have tn tags
rts_num = tn*sound_num
like_num = 25
follow_num = 25

log(debug, logger, "User: user_id")
#Generate Users
user_num.times do
  user = User.create(:email=>Faker::Internet.email, :password=>"111111", :password_confirmation=>"111111")
  log(debug, logger, user.id.to_s)
end


log(debug, logger, "Sound: sound_id, location")
#Generate Sounds
sound_num.times do |i|
  #user_id = i%user_num + 1 # from 1 to user_num
  user_id = rand(1..user_num)
  location = get_location(city_locations, rand(0..city_locations.length - 1))
  log(debug, logger, location.to_s)
  sound = Sound.create(:location=>"#{location['long']},#{location['lat']}", :longitude => location["long"], :latitude => location["lat"], :description => Faker::Lorem.sentence, :path => '0.mp3', :title => Faker::Lorem.sentence, :user_id => user_id)
  log(debug, logger, sound.id.to_s+", "+sound.location)
end

log(debug, logger, "Follow: follower, user")
#Every user has 'follow_num' followers
users = User.all
for user in users
  follow_num.times do
    follower = User.find(rand(1..user_num))

    while follower.following?(user)
      follower = User.find(rand(1..user_num))
    end

    follower.follow!(user)
    log(debug, logger, follower.id.to_s+", "+user.id.to_s)
  end
end


log(debug, logger, "Like: user, sound")
#Every user has 'like_num' favored sounds
#users = User.all
for user in users
  like_num.times do
    sound = Sound.find(rand(1..sound_num))

    while user.liking?(sound)
      sound = Sound.find(rand(1..sound_num))
    end

    user.like!(sound)
    log(debug, logger, user.id.to_s+", "+sound.id.to_s)
  end
end

log(debug, logger, "Tag: tag_id")
#Generate tags
tag_num.times do
  tag = Tag.create(:title=>Faker::Lorem.word, :count=>0)
  log(debug, logger, tag.id.to_s)
end

log(debug, logger, "R_Tag_Sound: tag_id, sound_id")
#Generate relationship between tag and sound
rts_num.times do |i|
  sound_id = i/tn + 1
  tag_id = rand(1..tag_num)
  tag = Tag.find(tag_id)
  SoundTagRelation.create(:sound_id=>sound_id, :tag_id=>tag_id)
  tag.increment

  log(debug, logger, tag.id.to_s+", "+sound_id.to_s)
end