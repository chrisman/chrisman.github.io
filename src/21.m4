define(__timestamp, 2021-03-25)dnl
define(__title, `Books I Read in 2020')dnl
define(__subtitle, `A year in review')dnl
define(__keywords, `')dnl
define(__id, 21)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

<style>
table {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 2px solid #000000;
  background-color: #4A4A4A;
  width: 100%;
  height: 200px;
  text-align: center;
  border-collapse: collapse;
}
table td, table th {
  border: 1px solid #4A4A4A;
  padding: 3px 2px;
}
table tbody td {
  font-size: 13px;
  color: #E6E6E6;
}
table tr:nth-child(even) {
  background: #888888;
}
table thead {
  background: #000000;
  border-bottom: 3px solid #000000;
}
table thead th {
  font-size: 15px;
  font-weight: bold;
  color: #E6E6E6;
  text-align: center;
  border-left: 2px solid #4A4A4A;
}
table thead th:first-child {
  border-left: none;
}

table tfoot {
  font-size: 12px;
  font-weight: bold;
  color: #E6E6E6;
  background: #000000;
  background: -moz-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
  background: -webkit-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
  background: linear-gradient(to bottom, #404040 0%, #191919 66%, #000000 100%);
  border-top: 1px solid #4A4A4A;
}
table tfoot td {
  font-size: 12px;
}
</style>

## Summary

This is an installment of my annual "Books I Read in XXXX" year-in-review series. It follows [the previous one](2.html).

So, 2020 was horrible. My mental health took a serious blow over the course of the year and I found myself, for the first time in my life, unable to read. I couldn't focus. And when I could, I couldn't tolerate the feeling of somebody else's words in my head.

It felt like a blow to my identity to be honest. I've always been an avid and constant reader. I've always measured time, and progress, and growth in books. I had to spent a lot of time figuring out who I am when I'm not doing the things that make me who I am.

At the beginning of 2020 I set a goal to read 100 books. Third year in a row making this ambitious goal. Third year failing. But it was my first time failing by such a large margain. In previous years, I read 83, 79, and 97 books.

This year I read about 50. If you count the ones I didn't finish.

A lot of them were bookclub books that I agreed to commit to in order to try forcing myself back into the habit. I don't remember most of them. Others are audiobooks that I started and then quit. And a lot of them are RPG rulebooks, which I tend to read a lot of anyway, but this year they provided a weird and very comforting solace of imagination without narrative.

If you're on goodreads, feel free to [follow me](https://www.goodreads.com/chrisman). I try to leave a review of everything I read.

Here are some numbers.

How many did I start vs. how many did I finish:

| Completion | Count |
|------------|-------|
| Finished   | 44 |
| Did not finish | 7 |

I am an unapologetic book putter downer. Life is too short to waste time on something you're not enjoying[^sofa]. Last year I abandoned 15 books. Which means that the number of books I start but don't finish roughly scales with the number of books I do finish. This year I did half of both compared to last year.

[^sofa]: I even coined #sofa to celebrate this practice: Start Often Finish rArely. It is perfectly okay to stop doing something if it no longer sparks joy.

Format:

| Format | Count |
|--------|-------|
| Audio | 13 |
| ebook | 32 |
| physical book | 6 |

I'm an ebook purist. I read print ebooks and I read audio ebooks, and that's about it.

I read a couple physical books this year. Mostly comics, and a couple software books from the library at work.


Pages:

| Pages | Count |
|-------|-------|
| Smallest value | 5 |
| Largest value | 849 |
| Sum | 11,426 |
| Mean | 243.106 |

Smallest number of pages is fake. Goodreads often counts the number of CDs or "parts" in an audiobook as pages. Don't really know what to do about that.

The actual smallest number of pages is 16, and that belongs to *The Quiet Year* a beautiful rpg rulebook about story telling and map drawing and enduring in the face of imminent disaster.

The longest book, at 849 pages, was 11/22/63 by Stephen King, which I really enjoyed, but about which--like most of King's work--I ultimately have kind of mixed feelings about.

## Awards

- Best book on software design: *A Philosophy Of Software Design*. This is probably the best book I've ever read on software design. 

- Worst classic: *How to Win Friends & Influence People*. How about "How to be a psychopath?" Actually, the very first bit on morals was pretty good. But the rest of the book was all manipulation and gross.

- Best book about gender/sex: *Born Both: An Intersex Life*. A great book about how sex is often as arbitrary as gender.

- Best YA Feminist Fantasy book: *Tess of the Road*: A young heroine takes to road to slay a dragon and *the dragon is internalized mysogony.*

- Best RPG: *Troika!* Troika really captured my imagination this year. The thing that it does that is really unique is eschew a setting or even classes in the traditional sense for a table of 36 unique backgrounds which, taken as a whole, start to suggest some kind of a cohesive universe. It is also immensely hackable and modifiable, something the creators encourage, and a very active community has sprung up around it on discord and itch.io.

    - Runnerup: *I’m Sorry Did You Say Street Magic*. The loveliness of this book's focus on narrative world-building and storytelling is matched by its beautiful layout and aesthetics.

- Best Fantasy: *The Blade Itself*. Absolutely riveting characters. I was mesmerized the whole time.

- Best Management Book: *Managing Humans*. A subjective choice because one highlight for the year was convincing the author, Michael Lopp, to come speak and answer questions at the bookclub meeting after we read this book together.

- Worst Book: *The Boys*. Awful everything. I don't know why I bothered picking it up. I hated the TV show too.

- Best "Everything" book: *A Lapsed Anarchist’s Approach to Managing Ourselves*. Part memoir, part cookbook, part philosophy, part anarchist political manifesto, part self-help, and oh yeah. Managing people and ourselves. I would pay money to live inside this guy's head for a day. Guess I'll have to settle for reading all the rest of his books.

## Data

Last year I kind of went through my list of books by hand.

This year I grabbed a [csv export](https://www.goodreads.com/review/import) and installed the truly awesome [csvkit](https://csvkit.readthedocs.io/en/latest/index.html) and just had it display and summarize the data for me:

| Title                                                                                                 | Author                | Date Added |  Date Read | My Rating | Exclusive Shelf   | Bookshelves                                                      | Number of Pages |
| ----------------------------------------------------------------------------------------------------- | --------------------- | ---------- | ---------- | --------- | ----------------- | ---------------------------------------------------------------- | --------------- |
| 11/22/63                                                                                              | Stephen King          | 2020-01-02 | 2020-02-23 |         3 | read              | ebook                                                            |             849 |
| Accelerate: Building and Scaling High-Performing Technology Organizations                             | Nicole Forsgren       | 2020-01-02 | 2020-01-12 |         4 | read              | professional, bookclub, technology, tangible-book                |             257 |
| We Are Indivisible: A Blueprint for Democracy After Trump                                             | Leah Greenberg        | 2020-01-02 | 2020-01-07 |         4 | read              | audio-book, politics                                             |                 |
| The Shadow/Batman                                                                                     | Steve Orlando         | 2020-01-05 |            |         3 | read              | comic-book, tangible-book                                        |             160 |
| The Witches Are Coming                                                                                | Lindy West            | 2020-01-09 | 2020-01-10 |         5 | read              | audio-book, feminist, politics, read-by-the-author               |             260 |
| Designing Your Life: Build a Life that Works for You                                                  | Bill Burnett          | 2020-01-13 | 2020-01-14 |         5 | read              | audio-book, professional                                         |             240 |
| An Elegant Puzzle: Systems of Engineering Management                                                  | Will Larson           | 2020-01-18 | 2020-02-25 |         3 | read              | tangible-book, professional, bookclub                            |             288 |
| Resilient Management                                                                                  | Lara   Hogan          | 2020-01-18 | 2020-01-18 |         5 | read              | ebook, professional, bookclub                                    |             105 |
| Providence Act 1                                                                                      | Alan Moore            | 2020-01-19 | 2020-01-27 |         2 | read              | tangible-book, comic-book, queer                                 |             176 |
| A Philosophy of Software Design                                                                       | John Ousterhout       | 2020-01-19 | 2020-01-23 |         5 | read              | tangible-book, professional                                      |             190 |
| When I Arrived at the Castle                                                                          | Emily Carroll         | 2020-01-19 |            |         4 | read              | comic-book, tangible-book                                        |              72 |
| How to Win Friends & Influence People                                                                 | Dale Carnegie         | 2020-01-22 |            |         1 | read              | audio-book                                                       |                 |
| Autonomous                                                                                            | Annalee Newitz        | 2020-01-23 | 2020-01-27 |         2 | read              | audio-book, sci-fi                                               |                 |
| The Five Dysfunctions of a Team                                                                       | Patrick Lencioni      | 2020-01-27 | 2020-01-28 |         1 | read              |                                                                  |               5 |
| Switch: How to Change Things When Change Is Hard                                                      | Chip Heath            | 2020-01-28 | 2020-01-31 |         3 | read              | audio-book                                                       |             294 |
| Fascism: A Warning                                                                                    | Madeleine K. Albright | 2020-02-02 | 2020-02-07 |         4 | read              | politics, audio-book, read-by-the-author                         |             320 |
| Uncanny Valley                                                                                        | Anna Wiener           | 2020-02-21 | 2020-02-25 |         3 | read              | audio-book, technology, memoir                                   |               9 |
| Lingo: A Language Spotter's Guide to Europe                                                           | Gaston Dorren         | 2020-02-23 | 2020-02-23 |         1 | abandoned         | abandoned                                                        |             304 |
| Tess of the Road (Tess of the Road, #1)                                                               | Rachel Hartman        | 2020-02-26 | 2020-03-15 |         5 | read              | young-adult, fantasy, ebook                                      |             544 |
| Good Strategy/Bad Strategy: The Difference and Why It Matters                                         | Richard P. Rumelt     | 2020-02-26 | 2020-02-29 |         3 | read              | audio-book                                                       |             705 |
| This Is How You Lose The Time War                                                                     | Amal El-Mohtar        | 2020-03-02 | 2020-03-04 |         4 | read              | audio-book, sci-fi                                               |             224 |
| Fate Core System                                                                                      | Leonard Balsera       | 2020-03-02 | 2020-02-15 |         4 | read              | rpg-rulebook                                                     |             302 |
| Born Both: An Intersex Life                                                                           | Hida Viloria          | 2020-03-04 | 2020-03-10 |         5 | read              | audio-book, gender, read-by-the-author, memoir                   |             339 |
| We Have Always Been Here: A Queer Muslim Memoir                                                       | Samra Habib           | 2020-03-10 | 2020-03-14 |         0 | abandoned         | audio-book, memoir, queer, abandoned                             |               6 |
| Blowout: Corrupted Democracy, Rogue State Russia, and the Richest, Most Destructive Industry on Earth | Rachel Maddow         | 2020-03-14 | 2020-03-27 |         0 | abandoned         | audio-book, non-fiction, politics, read-by-the-author, abandoned |                 |
| Because Internet: Understanding the New Rules of Language                                             | Gretchen McCulloch    | 2020-03-16 | 2020-05-04 |         3 | read              | ebook, non-fiction                                               |             335 |
| Storm King's Thunder (Dungeons & Dragons, 5th Edition)                                                | Wizards of the Coast  | 2020-03-21 | 2020-03-21 |         4 | read              | dnd, rpg-rulebook                                                |             256 |
| Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones                             | James Clear           | 2020-03-27 | 2020-05-04 |         0 | abandoned         | abandoned                                                        |             319 |
| We                                                                                                    | Yevgeny Zamyatin      | 2020-03-27 | 2020-05-04 |         0 | abandoned         | abandoned                                                        |             224 |
| The Blade Itself (The First Law, #1)                                                                  | Joe Abercrombie       | 2020-05-04 | 2020-07-08 |         5 | read              | fantasy                                                          |             515 |
| No Cure for the Paladin Blues (The Order of the Stick, #2)                                            | Rich Burlew           | 2020-05-09 |            |         0 | abandoned         | comic-book, ebook, dnd, abandoned                                |             244 |
| Dungeon Crawlin' Fools (The Order of the Stick, #1)                                                   | Rich Burlew           | 2020-05-09 | 2020-05-09 |         3 | read              | comic-book, ebook                                                |             160 |
| Professor Frisby's Mostly Adequate Guide to Functional Programming                                    | Brian Lonsdorf        | 2020-06-20 | 2020-06-20 |         5 | read              | technology, programming                                          |             146 |
| Managing Humans: Biting and Humorous Tales of a Software Engineering Manager                          | Michael Lopp          | 2020-06-30 | 2020-07-16 |         4 | read              | bookclub, non-fiction, professional                              |             209 |
| Shape Up: Stop Running in Circles and Ship Work that Matters                                          | Ryan Singer           | 2020-07-14 | 2020-07-18 |         3 | read              | professional, ebook                                              |             133 |
| Too Much and Never Enough: How My Family Created the World's Most Dangerous Man                       | Mary L. Trump         | 2020-07-18 | 2021-01-06 |         5 | read              | politics                                                         |             225 |
| This Is Where You Belong: The Art and Science of Loving the Place You Live                            | Melody Warnick        | 2020-07-22 | 2020-08-29 |         3 | read              | ebook                                                            |             308 |
| The Quiet Year                                                                                        | Avery Alder           | 2020-07-28 | 2020-07-28 |         4 | read              | ebook, rpg-rulebook                                              |              16 |
| Microscope                                                                                            | Ben  Robbins          | 2020-07-28 | 2020-07-28 |         5 | read              | rpg-rulebook, ebook                                              |              80 |
| The Magicians (The Magicians, #1)                                                                     | Lev Grossman          | 2020-07-31 | 2020-08-29 |         4 | read              | ebook, fantasy                                                   |             402 |
| We3                                                                                                   | Grant Morrison        | 2020-07-31 | 2020-07-31 |         3 | read              | comic-book, ebook                                                |             104 |
| Troika!                                                                                               | Daniel Sell           | 2020-08-02 | 2020-08-02 |         4 | read              | ebook, rpg-rulebook                                              |              53 |
| The Boys, Volume 1: The Name of the Game                                                              | Garth Ennis           | 2020-08-04 | 2020-08-04 |         3 | read              | comic-book, ebook                                                |             152 |
| The Boys, Volume 2: Get Some                                                                          | Garth Ennis           | 2020-08-05 | 2020-08-04 |         2 | read              | comic-book, ebook                                                |             192 |
| How to Read a Book: the classic guide to intelligent reading                                          | Mortimer J. Adler     | 2020-08-29 |            |         0 | currently-reading | currently-reading                                                |             425 |
| A Lapsed Anarchist's Approach to Managing Ourselves                                                   | Ari Weinzweig         | 2020-09-03 | 2020-09-04 |         5 | read              | bookclub, ebook                                                  |             490 |
| A Wizard of Earthsea (Earthsea Cycle, #1)                                                             | Ursula K. Le Guin     | 2020-10-20 | 2020-11-04 |         3 | read              | fantasy, young-adult                                             |             183 |
| Such a Fun Age                                                                                        | Kiley Reid            | 2020-11-04 | 2021-01-04 |         4 | read              | race                                                             |             310 |
| Why I Am Not Going to Buy a Computer                                                                  | Wendell Berry         | 2020-11-04 | 2020-11-04 |         3 | read              |                                                                  |              48 |
| Tasha’s Cauldron of Everything (Dungeons & Dragons, 5th Edition)                                      | Wizards of the Coast  | 2020-12-20 |            |         5 | read              | rpg-rulebook                                                     |             192 |
| I'm Sorry Did You Say Street Magic                                                                    | Caro Asercion         | 2020-12-22 | 2020-12-22 |         5 | read              | rpg-rulebook                                                     |              56 |



  1. "Title"

	Type of data:          Text
	Contains null values:  False
	Unique values:         51
	Longest value:         101 characters
	Most common values:    11/22/63 (1x)
	                       Accelerate: Building and Scaling High-Performing Technology Organizations (1x)
	                       We Are Indivisible: A Blueprint for Democracy After Trump (1x)
	                       The Shadow/Batman (1x)
	                       The Witches Are Coming (1x)

  2. "Date Added"

	Type of data:          Date
	Contains null values:  False
	Unique values:         39
	Smallest value:        2020-01-02
	Largest value:         2020-12-22
	Most common values:    2020-01-02 (3x)
	                       2020-01-19 (3x)
	                       2020-01-18 (2x)
	                       2020-02-26 (2x)
	                       2020-03-02 (2x)

  3. "Date Read"

	Type of data:          Date
	Contains null values:  True (excluded from calculations)
	Unique values:         37
	Smallest value:        2020-01-07
	Largest value:         2021-01-06
	Most common values:    None (6x)
	                       2020-05-04 (3x)
	                       2020-02-23 (2x)
	                       2020-02-25 (2x)
	                       2020-01-27 (2x)

  4. "My Rating"

	Type of data:          Number
	Contains null values:  False
	Unique values:         6
	Smallest value:        0
	Largest value:         5
	Sum:                   164
	Mean:                  3.216
	Median:                3
	StDev:                 1.616
	Most common values:    3 (14x)
	                       5 (13x)
	                       4 (12x)
	                       0 (6x)
	                       2 (3x)

  5. "Exclusive Shelf"

	Type of data:          Text
	Contains null values:  False
	Unique values:         3
	Longest value:         17 characters
	Most common values:    read (44x)
	                       abandoned (6x)
	                       currently-reading (1x)

  6. "Bookshelves"

	Type of data:          Text
	Contains null values:  True (excluded from calculations)
	Unique values:         37
	Longest value:         64 characters
	Most common values:    comic-book, ebook (4x)
	                       audio-book (3x)
	                       abandoned (3x)
	                       rpg-rulebook (3x)
	                       ebook (2x)

  7. "Number of Pages"

	Type of data:          Number
	Contains null values:  True (excluded from calculations)
	Unique values:         45
	Smallest value:        5
	Largest value:         849
	Sum:                   11,426
	Mean:                  243.106
	Median:                224
	StDev:                 174.425
	Most common values:    None (4x)
	                       160 (2x)
	                       224 (2x)
	                       192 (2x)
	                       849 (1x)

Row count: 51


changequote`'dnl change quotes `back to default'
include(src/footer.html)
