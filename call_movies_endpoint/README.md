# Instructions:

Write an HTTP GET method to retrieve information from a movie database.

Given a string `substr`, the function `getMovieTitles` must perform the following tasks:

1. Query https://jsonmock.hackerrank.com/api/moviesdata/search/?Title=substr (replace `substr`). 

2. Initialize the titles array to store total string elements. Store the `Title` from each record returned in the data field to the titles array.

3. Sort titles in ascending order and return it as the answer.
 

The query response from the website is a JSON response with the following five fields:

    page: The current page
    per_page: The maximum number of results per page
    total: The total number of records in the search result
    total_pages: The total number of pages which must be queried to get all the results
    data: An array of JSON objects containing movie information

Each data array object has the following 3 fields:

    Title: the movie title
    Year: year of release
    imdbID: a unique identifier


If there are multiple pages to retrieve, the query should read:

https://jsonmock.hackerrank.com/api/moviesdata/search/?Title=substr&page=pageNumber

(replace `substr` and `pageNumber`)


## Function Description

Complete the `getMovieTitles` function in the editor below.

`getMovieTitles` has the following parameter(s):

    substr: a string

Returns:

string[]: an array of strings, titles sorted in ascending order.