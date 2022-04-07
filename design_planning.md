worst_words
|column| type| example or note|
|--|--|--|
|wid | uuid | n/a|
|label | text | ex: "you guys"|
|user_id| uuid| the id of the creator|
|reason| text| n/a|


better_words

|column| type| example|
|--|--|--|
|bid|uuid| n/a|
label | text | ex: "you guys"|
|user_id| uuid| the id of the creator|
|reason| text| n/a|
|worst_word_id| uuid | n/a |

votes
|column| type| example|
|--|--|--|
|id|uuid| n/a|
|polarity| int | possible values: [-1, 0, 1]|
|better_word_id| uuid | n/a|
|user_id| uuid | n/a |


users
|column| type| example|
|--|--|--|
|uid|uuid| n/a|
|name| text| ex: Takudzwa|
