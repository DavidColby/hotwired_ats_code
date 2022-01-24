# README

The code in this repository is intended as a companion for the content of the [Hotwired ATS book](https://hotwiringrails.com). This book offers a step-by-step tutorial through building a Rails 7 application of meaningful size and complexity using my preferred set of tools to build modern Rails applications.

While you can use this code on its own, without reading the book, you may find the code difficult to fully understand without the context provided by the book.

The `main` branch of this repository is intentionally empty. The code changes that make up the application can be found in chapter-specific branches. The final code is, helpfully, in the `final` branch.

## What does the code in this repository do? What will we build in the book?
Hotwired ATS is a small-scale applicant tracking system. The application revolves around `Jobs` and `Applicants`. Jobs contain details about an open job posting a company has, like the job title and description, and where the job is located. Applicants apply to job postings, adding their name, contact information, and a resume when they do so.

Users manage Jobs and Applicants through an administrative interface. Users create and update jobs and move applicants through a simple, four stage hiring process. Users can send emails to applicants, and receive replies to those emails through the application. Users can manage other users in their account, including inviting new users to join them in the account. Applicants can view a company's job postings and apply to jobs they are interested in. Users can view their account data on interactive charts, filtering down to the data that is most interesting to them. Users receive notifications in the app when an applicant sends them an email reply.

We use a combination of Turbo Frames, Turbo Streams, Stimulus, CableReady, and StimulusReflex to implement each of these features, with the particular set of tools varying based on what is most appropriate for the set of features. In some instances, I'll show you how to build the same feature using different pieces of the toolset, so you can get a feel for the difference ways to approach common UX problems in Rails.

## Who is this book for?

This book is likely to be most valuable for junior and intermediate level Rails developers who want to learn more about Hotwire and modern, reactive Rails applications. More seasoned Rails developers who have not yet had a chance to work with the Hotwire stack, StimulusReflex, and CableReady should find the book valuable as well.

If you already feel very comfortable using Hotwire, CableReady, and StimulusReflex in your applications, this book may not be the right match for you.

Developers who have never used Rails before should not start with this book. The book moves very quickly past "basic" Rails code to spend more time on Hotwire, StimulusReflex, and the surrounding ecosystem of tools that are the core focus of the book.

If you have read and enjoyed the step-by-step tutorials I write at [colby.so](https://colby.so), I think you will find using this book as a learning resource for modern Rails tools enjoyable and valuable.

## What tools will I learn in this book? Will I have a commercial-grade Rails 7 application at my finger tips after I read the book?

The book's core focus is on introducing and using Stimulus, Turbo, CableReady, and StimulusReflex in a Rails 7 application. An emphasis is placed on opportunities to use these technologies and learn about these tools, sometimes at the expense of commercial-ready code.

I wrote each line of code in the book with an eye knowing that each line would need to be explained to a reader. Sometimes this means that the final implementation of a feature may be less scalable than a more complex or thoughtfully engineered approach would be. Throughout the book, we will attempt to take the most direct route to opportunities to learn about Stimulus, Turbo Frames, Turbo Streams, CableReady, and StimulusReflex.

I made an intentional decision to simplify certain features and to exclude some tools (like View Components) to keep the learning focus on the core set of technologies the book is focused on. There are only so many new tools one can learn at a time, and I chose the tools that I feel are most likely to make a major impact on a developer's happiness while building full-stack Ruby on Rails applications.

This book does not make a concerted effort to optimize code for production or to provide a base for building your own SaaS on top of it. Most prominently, no time is dedicated to implementing useful data validations or user and account-level authorization. We also will not build a billing management system in to the application. Because of the timing of this book's release, we also have to (temporarily) hack around Devise <> Turbo interaction problems in an unpleasant way.

If you choose to buy the book or clone this repo with the intention of building a real product on top of it, please be advised that you will absolutely need to refactor some code and add a significant amount of additional code before having a commercially viable product. Some of the code, as you can see in this repository, might be ugly or less efficient than possible. Some ideas might even be a bit silly — any bad code in the book or in this repo is entirely my fault. Sometimes my odd decisions may have been made in an effort to reduce the mental overhead required to build a new feature, sometimes I might have just missed a better way to build the feature!

Also, there are no tests. The book does not cover testing, so the code base does not include tests!

If you are looking for a ready to go Rails template for your new SaaS idea, you can find excellent options from [Jumpstart Pro](https://jumpstartrails.com/) and [Bullet Train](https://bullettrain.co/).
