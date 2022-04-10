## 🏆 Full-Stack Engineer Technical Challenge - In The Memory

Please find below the schema of DB that I used :
<img src="memory-test-schema-db.png" width="400" />

Type of columns : yellow -> integers or floats, red -> strings

You would find unit tests in test/models/ and check if they pass with :
```bash
rails test test/models
```

To make it work, please do not forget below commands:
```bash
bundle install
yarn install
rails db:create db:migrate db:seeds
```

You can launch a local server with below command:
```bash
rails s
```

##### 1. Summary view

The three following metrics are present and calculated in the dashboard:
- Total revenue
- Average revenue per order
- Number of unique customers

Please find below the screen on all orders
<img src="memory-test-screen.png" width="400" />

For the filter by country exercise, unfortunately the web app does not access the correct partial, so it does not work.

##### 2. Monthly view

I installed the Blazer gem to do the monthly revenue view. But I had an issue on seeds, there was only 2 dates for all orders, so I did not managed to do it, especially within the 8 hours.

#### 🎁 Bonus Point

Make the dashboard publicly accessible through a url.
-> Since the seeds is very big, and even though I managed to improve the code to reduce the seeding time, I can't push it to Heroku. It would take too much time.

---
Thanks for letting me do the technical test.
