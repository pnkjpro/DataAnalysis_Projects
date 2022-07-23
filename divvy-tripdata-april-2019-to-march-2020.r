{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "1e30d50b",
   "metadata": {
    "papermill": {
     "duration": 0.013822,
     "end_time": "2022-07-23T21:46:07.742065",
     "exception": false,
     "start_time": "2022-07-23T21:46:07.728243",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**--------------------Divvy Tripdata from April 2019 to March 2020-------------**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c3cdf338",
   "metadata": {
    "papermill": {
     "duration": 0.010166,
     "end_time": "2022-07-23T21:46:07.762974",
     "exception": false,
     "start_time": "2022-07-23T21:46:07.752808",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Loading Library"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5c1bce53",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:07.783574Z",
     "iopub.status.busy": "2022-07-23T21:46:07.780334Z",
     "iopub.status.idle": "2022-07-23T21:46:09.148941Z",
     "shell.execute_reply": "2022-07-23T21:46:09.147083Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 1.381005,
     "end_time": "2022-07-23T21:46:09.151533",
     "exception": false,
     "start_time": "2022-07-23T21:46:07.770528",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘scales’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    discard\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    col_factor\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(lubridate)\n",
    "library(scales)\n",
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "080f8e35",
   "metadata": {
    "papermill": {
     "duration": 0.007712,
     "end_time": "2022-07-23T21:46:09.166940",
     "exception": false,
     "start_time": "2022-07-23T21:46:09.159228",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Importing Datasets"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "6011c2c4",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:09.216729Z",
     "iopub.status.busy": "2022-07-23T21:46:09.183875Z",
     "iopub.status.idle": "2022-07-23T21:46:19.010816Z",
     "shell.execute_reply": "2022-07-23T21:46:19.007991Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 9.840839,
     "end_time": "2022-07-23T21:46:19.015296",
     "exception": false,
     "start_time": "2022-07-23T21:46:09.174457",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m1108163\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): 03 - Rental Start Station Name, 02 - Rental End Station Name, User...\n",
      "\u001b[32mdbl\u001b[39m  (5): 01 - Rental Details Rental ID, 01 - Rental Details Bike ID, 03 - R...\n",
      "\u001b[34mdttm\u001b[39m (2): 01 - Rental Details Local Start Time, 01 - Rental Details Local En...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m1640718\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): from_station_name, to_station_name, usertype, gender\n",
      "\u001b[32mdbl\u001b[39m  (5): trip_id, bikeid, from_station_id, to_station_id, birthyear\n",
      "\u001b[34mdttm\u001b[39m (2): start_time, end_time\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m704054\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): from_station_name, to_station_name, usertype, gender\n",
      "\u001b[32mdbl\u001b[39m  (5): trip_id, bikeid, from_station_id, to_station_id, birthyear\n",
      "\u001b[34mdttm\u001b[39m (2): start_time, end_time\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m426887\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (5): ride_id, rideable_type, start_station_name, end_station_name, memb...\n",
      "\u001b[32mdbl\u001b[39m  (6): start_station_id, end_station_id, start_lat, start_lng, end_lat, e...\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q2_2019=read_csv('../input/divvy-trips-data-20192020/Divvy_Trips_2019_Q2.csv')\n",
    "q3_2019=read_csv('../input/divvy-trips-data-20192020/Divvy_Trips_2019_Q3.csv')\n",
    "q4_2019=read_csv('../input/divvy-trips-data-20192020/Divvy_Trips_2019_Q4.csv')\n",
    "q1_2020=read_csv('../input/divvy-trips-data-20192020/Divvy_Trips_2020_Q1.csv')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a63de548",
   "metadata": {
    "papermill": {
     "duration": 0.008345,
     "end_time": "2022-07-23T21:46:19.031923",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.023578",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Checking for Inconsistent Name and No. of Columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "65625cb9",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:19.051863Z",
     "iopub.status.busy": "2022-07-23T21:46:19.050426Z",
     "iopub.status.idle": "2022-07-23T21:46:19.101834Z",
     "shell.execute_reply": "2022-07-23T21:46:19.100227Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.063939,
     "end_time": "2022-07-23T21:46:19.103976",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.040037",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'01 - Rental Details Rental ID'</li><li>'01 - Rental Details Local Start Time'</li><li>'01 - Rental Details Local End Time'</li><li>'01 - Rental Details Bike ID'</li><li>'01 - Rental Details Duration In Seconds Uncapped'</li><li>'03 - Rental Start Station ID'</li><li>'03 - Rental Start Station Name'</li><li>'02 - Rental End Station ID'</li><li>'02 - Rental End Station Name'</li><li>'User Type'</li><li>'Member Gender'</li><li>'05 - Member Details Member Birthday Year'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '01 - Rental Details Rental ID'\n",
       "\\item '01 - Rental Details Local Start Time'\n",
       "\\item '01 - Rental Details Local End Time'\n",
       "\\item '01 - Rental Details Bike ID'\n",
       "\\item '01 - Rental Details Duration In Seconds Uncapped'\n",
       "\\item '03 - Rental Start Station ID'\n",
       "\\item '03 - Rental Start Station Name'\n",
       "\\item '02 - Rental End Station ID'\n",
       "\\item '02 - Rental End Station Name'\n",
       "\\item 'User Type'\n",
       "\\item 'Member Gender'\n",
       "\\item '05 - Member Details Member Birthday Year'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '01 - Rental Details Rental ID'\n",
       "2. '01 - Rental Details Local Start Time'\n",
       "3. '01 - Rental Details Local End Time'\n",
       "4. '01 - Rental Details Bike ID'\n",
       "5. '01 - Rental Details Duration In Seconds Uncapped'\n",
       "6. '03 - Rental Start Station ID'\n",
       "7. '03 - Rental Start Station Name'\n",
       "8. '02 - Rental End Station ID'\n",
       "9. '02 - Rental End Station Name'\n",
       "10. 'User Type'\n",
       "11. 'Member Gender'\n",
       "12. '05 - Member Details Member Birthday Year'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"01 - Rental Details Rental ID\"                   \n",
       " [2] \"01 - Rental Details Local Start Time\"            \n",
       " [3] \"01 - Rental Details Local End Time\"              \n",
       " [4] \"01 - Rental Details Bike ID\"                     \n",
       " [5] \"01 - Rental Details Duration In Seconds Uncapped\"\n",
       " [6] \"03 - Rental Start Station ID\"                    \n",
       " [7] \"03 - Rental Start Station Name\"                  \n",
       " [8] \"02 - Rental End Station ID\"                      \n",
       " [9] \"02 - Rental End Station Name\"                    \n",
       "[10] \"User Type\"                                       \n",
       "[11] \"Member Gender\"                                   \n",
       "[12] \"05 - Member Details Member Birthday Year\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'trip_id'</li><li>'start_time'</li><li>'end_time'</li><li>'bikeid'</li><li>'tripduration'</li><li>'from_station_id'</li><li>'from_station_name'</li><li>'to_station_id'</li><li>'to_station_name'</li><li>'usertype'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'trip\\_id'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'bikeid'\n",
       "\\item 'tripduration'\n",
       "\\item 'from\\_station\\_id'\n",
       "\\item 'from\\_station\\_name'\n",
       "\\item 'to\\_station\\_id'\n",
       "\\item 'to\\_station\\_name'\n",
       "\\item 'usertype'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'trip_id'\n",
       "2. 'start_time'\n",
       "3. 'end_time'\n",
       "4. 'bikeid'\n",
       "5. 'tripduration'\n",
       "6. 'from_station_id'\n",
       "7. 'from_station_name'\n",
       "8. 'to_station_id'\n",
       "9. 'to_station_name'\n",
       "10. 'usertype'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"trip_id\"           \"start_time\"        \"end_time\"         \n",
       " [4] \"bikeid\"            \"tripduration\"      \"from_station_id\"  \n",
       " [7] \"from_station_name\" \"to_station_id\"     \"to_station_name\"  \n",
       "[10] \"usertype\"          \"gender\"            \"birthyear\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'trip_id'</li><li>'start_time'</li><li>'end_time'</li><li>'bikeid'</li><li>'tripduration'</li><li>'from_station_id'</li><li>'from_station_name'</li><li>'to_station_id'</li><li>'to_station_name'</li><li>'usertype'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'trip\\_id'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'bikeid'\n",
       "\\item 'tripduration'\n",
       "\\item 'from\\_station\\_id'\n",
       "\\item 'from\\_station\\_name'\n",
       "\\item 'to\\_station\\_id'\n",
       "\\item 'to\\_station\\_name'\n",
       "\\item 'usertype'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'trip_id'\n",
       "2. 'start_time'\n",
       "3. 'end_time'\n",
       "4. 'bikeid'\n",
       "5. 'tripduration'\n",
       "6. 'from_station_id'\n",
       "7. 'from_station_name'\n",
       "8. 'to_station_id'\n",
       "9. 'to_station_name'\n",
       "10. 'usertype'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"trip_id\"           \"start_time\"        \"end_time\"         \n",
       " [4] \"bikeid\"            \"tripduration\"      \"from_station_id\"  \n",
       " [7] \"from_station_name\" \"to_station_id\"     \"to_station_name\"  \n",
       "[10] \"usertype\"          \"gender\"            \"birthyear\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "12"
      ],
      "text/latex": [
       "12"
      ],
      "text/markdown": [
       "12"
      ],
      "text/plain": [
       "[1] 12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "12"
      ],
      "text/latex": [
       "12"
      ],
      "text/markdown": [
       "12"
      ],
      "text/plain": [
       "[1] 12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "12"
      ],
      "text/latex": [
       "12"
      ],
      "text/markdown": [
       "12"
      ],
      "text/plain": [
       "[1] 12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "13"
      ],
      "text/latex": [
       "13"
      ],
      "text/markdown": [
       "13"
      ],
      "text/plain": [
       "[1] 13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q2_2019)\n",
    "colnames(q3_2019)\n",
    "colnames(q4_2019)\n",
    "colnames(q1_2020)\n",
    "\n",
    "ncol(q2_2019)\n",
    "ncol(q3_2019)\n",
    "ncol(q4_2019)\n",
    "ncol(q1_2020)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9c399c0a",
   "metadata": {
    "papermill": {
     "duration": 0.009484,
     "end_time": "2022-07-23T21:46:19.123403",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.113919",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Renaming Columns Name to Make Consistent with q1_2020"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "3d1bfef5",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:19.145985Z",
     "iopub.status.busy": "2022-07-23T21:46:19.144434Z",
     "iopub.status.idle": "2022-07-23T21:46:19.341811Z",
     "shell.execute_reply": "2022-07-23T21:46:19.339751Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.211578,
     "end_time": "2022-07-23T21:46:19.344605",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.133027",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'01 - Rental Details Duration In Seconds Uncapped'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li><li>'Member Gender'</li><li>'05 - Member Details Member Birthday Year'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item '01 - Rental Details Duration In Seconds Uncapped'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'Member Gender'\n",
       "\\item '05 - Member Details Member Birthday Year'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. '01 - Rental Details Duration In Seconds Uncapped'\n",
       "6. 'start_station_id'\n",
       "7. 'start_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'end_station_name'\n",
       "10. 'member_casual'\n",
       "11. 'Member Gender'\n",
       "12. '05 - Member Details Member Birthday Year'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"                                         \n",
       " [2] \"started_at\"                                      \n",
       " [3] \"ended_at\"                                        \n",
       " [4] \"rideable_type\"                                   \n",
       " [5] \"01 - Rental Details Duration In Seconds Uncapped\"\n",
       " [6] \"start_station_id\"                                \n",
       " [7] \"start_station_name\"                              \n",
       " [8] \"end_station_id\"                                  \n",
       " [9] \"end_station_name\"                                \n",
       "[10] \"member_casual\"                                   \n",
       "[11] \"Member Gender\"                                   \n",
       "[12] \"05 - Member Details Member Birthday Year\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'tripduration'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'tripduration'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. 'tripduration'\n",
       "6. 'start_station_id'\n",
       "7. 'start_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'end_station_name'\n",
       "10. 'member_casual'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"started_at\"         \"ended_at\"          \n",
       " [4] \"rideable_type\"      \"tripduration\"       \"start_station_id\"  \n",
       " [7] \"start_station_name\" \"end_station_id\"     \"end_station_name\"  \n",
       "[10] \"member_casual\"      \"gender\"             \"birthyear\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'tripduration'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'tripduration'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. 'tripduration'\n",
       "6. 'start_station_id'\n",
       "7. 'start_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'end_station_name'\n",
       "10. 'member_casual'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"started_at\"         \"ended_at\"          \n",
       " [4] \"rideable_type\"      \"tripduration\"       \"start_station_id\"  \n",
       " [7] \"start_station_name\" \"end_station_id\"     \"end_station_name\"  \n",
       "[10] \"member_casual\"      \"gender\"             \"birthyear\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "q2_2019=rename(q2_2019,\n",
    "               ride_id = \"01 - Rental Details Rental ID\",\n",
    "               rideable_type = \"01 - Rental Details Bike ID\",\n",
    "               started_at = \"01 - Rental Details Local Start Time\",\n",
    "               ended_at = \"01 - Rental Details Local End Time\",  \n",
    "               start_station_name = \"03 - Rental Start Station Name\",\n",
    "               start_station_id = \"03 - Rental Start Station ID\",\n",
    "               end_station_name = \"02 - Rental End Station Name\",\n",
    "               end_station_id = \"02 - Rental End Station ID\",\n",
    "               member_casual = \"User Type\"\n",
    ")\n",
    "colnames(q2_2019)\n",
    "\n",
    "q3_2019=rename(q3_2019,\n",
    "               ride_id = \"trip_id\",\n",
    "               rideable_type = \"bikeid\",\n",
    "               started_at = \"start_time\",\n",
    "               ended_at = \"end_time\",\n",
    "               start_station_name = \"from_station_name\",\n",
    "               start_station_id = \"from_station_id\",\n",
    "               end_station_name = \"to_station_name\",\n",
    "               end_station_id = \"to_station_id\",\n",
    "               member_casual = \"usertype\"\n",
    ")\n",
    "colnames(q3_2019)\n",
    "\n",
    "q4_2019=rename(q4_2019,\n",
    "               ride_id = \"trip_id\",\n",
    "               rideable_type = \"bikeid\",\n",
    "               started_at = \"start_time\",\n",
    "               ended_at = \"end_time\",\n",
    "               start_station_name = \"from_station_name\",\n",
    "               start_station_id = \"from_station_id\",\n",
    "               end_station_name = \"to_station_name\",\n",
    "               end_station_id = \"to_station_id\",\n",
    "               member_casual = \"usertype\"\n",
    ")\n",
    "colnames(q4_2019)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f2792aa",
   "metadata": {
    "papermill": {
     "duration": 0.017112,
     "end_time": "2022-07-23T21:46:19.372422",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.355310",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Checking and Changing Datatype of Columns to make it consistent for Merging"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "276ce72f",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:19.396228Z",
     "iopub.status.busy": "2022-07-23T21:46:19.394674Z",
     "iopub.status.idle": "2022-07-23T21:46:19.763936Z",
     "shell.execute_reply": "2022-07-23T21:46:19.762247Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.383822,
     "end_time": "2022-07-23T21:46:19.766333",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.382511",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [1,108,163 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id                                         : num [1:1108163] 22178529 22178530 22178531 22178532 22178533 ...\n",
      " $ started_at                                      : POSIXct[1:1108163], format: \"2019-04-01 00:02:22\" \"2019-04-01 00:03:02\" ...\n",
      " $ ended_at                                        : POSIXct[1:1108163], format: \"2019-04-01 00:09:48\" \"2019-04-01 00:20:30\" ...\n",
      " $ rideable_type                                   : num [1:1108163] 6251 6226 5649 4151 3270 ...\n",
      " $ 01 - Rental Details Duration In Seconds Uncapped: num [1:1108163] 446 1048 252 357 1007 ...\n",
      " $ start_station_id                                : num [1:1108163] 81 317 283 26 202 420 503 260 211 211 ...\n",
      " $ start_station_name                              : chr [1:1108163] \"Daley Center Plaza\" \"Wood St & Taylor St\" \"LaSalle St & Jackson Blvd\" \"McClurg Ct & Illinois St\" ...\n",
      " $ end_station_id                                  : num [1:1108163] 56 59 174 133 129 426 500 499 211 211 ...\n",
      " $ end_station_name                                : chr [1:1108163] \"Desplaines St & Kinzie St\" \"Wabash Ave & Roosevelt Rd\" \"Canal St & Madison St\" \"Kingsbury St & Kinzie St\" ...\n",
      " $ member_casual                                   : chr [1:1108163] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n",
      " $ Member Gender                                   : chr [1:1108163] \"Male\" \"Female\" \"Male\" \"Male\" ...\n",
      " $ 05 - Member Details Member Birthday Year        : num [1:1108163] 1975 1984 1990 1993 1992 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   `01 - Rental Details Rental ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `01 - Rental Details Local Start Time` = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   `01 - Rental Details Local End Time` = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   `01 - Rental Details Bike ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `01 - Rental Details Duration In Seconds Uncapped` = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   `03 - Rental Start Station ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `03 - Rental Start Station Name` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `02 - Rental End Station ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `02 - Rental End Station Name` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `User Type` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Member Gender` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `05 - Member Details Member Birthday Year` = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [1,640,718 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : num [1:1640718] 23479388 23479389 23479390 23479391 23479392 ...\n",
      " $ started_at        : POSIXct[1:1640718], format: \"2019-07-01 00:00:27\" \"2019-07-01 00:01:16\" ...\n",
      " $ ended_at          : POSIXct[1:1640718], format: \"2019-07-01 00:20:41\" \"2019-07-01 00:18:44\" ...\n",
      " $ rideable_type     : num [1:1640718] 3591 5353 6180 5540 6014 ...\n",
      " $ tripduration      : num [1:1640718] 1214 1048 1554 1503 1213 ...\n",
      " $ start_station_id  : num [1:1640718] 117 381 313 313 168 300 168 313 43 43 ...\n",
      " $ start_station_name: chr [1:1640718] \"Wilton Ave & Belmont Ave\" \"Western Ave & Monroe St\" \"Lakeview Ave & Fullerton Pkwy\" \"Lakeview Ave & Fullerton Pkwy\" ...\n",
      " $ end_station_id    : num [1:1640718] 497 203 144 144 62 232 62 144 195 195 ...\n",
      " $ end_station_name  : chr [1:1640718] \"Kimball Ave & Belmont Ave\" \"Western Ave & 21st St\" \"Larrabee St & Webster Ave\" \"Larrabee St & Webster Ave\" ...\n",
      " $ member_casual     : chr [1:1640718] \"Subscriber\" \"Customer\" \"Customer\" \"Customer\" ...\n",
      " $ gender            : chr [1:1640718] \"Male\" NA NA NA ...\n",
      " $ birthyear         : num [1:1640718] 1992 NA NA NA NA ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   trip_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   end_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   bikeid = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   tripduration = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   from_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   from_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   to_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   to_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   usertype = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   gender = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   birthyear = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [704,054 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : num [1:704054] 25223640 25223641 25223642 25223643 25223644 ...\n",
      " $ started_at        : POSIXct[1:704054], format: \"2019-10-01 00:01:39\" \"2019-10-01 00:02:16\" ...\n",
      " $ ended_at          : POSIXct[1:704054], format: \"2019-10-01 00:17:20\" \"2019-10-01 00:06:34\" ...\n",
      " $ rideable_type     : num [1:704054] 2215 6328 3003 3275 5294 ...\n",
      " $ tripduration      : num [1:704054] 940 258 850 2350 1867 ...\n",
      " $ start_station_id  : num [1:704054] 20 19 84 313 210 156 84 156 156 336 ...\n",
      " $ start_station_name: chr [1:704054] \"Sheffield Ave & Kingsbury St\" \"Throop (Loomis) St & Taylor St\" \"Milwaukee Ave & Grand Ave\" \"Lakeview Ave & Fullerton Pkwy\" ...\n",
      " $ end_station_id    : num [1:704054] 309 241 199 290 382 226 142 463 463 336 ...\n",
      " $ end_station_name  : chr [1:704054] \"Leavitt St & Armitage Ave\" \"Morgan St & Polk St\" \"Wabash Ave & Grand Ave\" \"Kedzie Ave & Palmer Ct\" ...\n",
      " $ member_casual     : chr [1:704054] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n",
      " $ gender            : chr [1:704054] \"Male\" \"Male\" \"Female\" \"Male\" ...\n",
      " $ birthyear         : num [1:704054] 1987 1998 1991 1990 1987 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   trip_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   end_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   bikeid = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   tripduration = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   from_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   from_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   to_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   to_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   usertype = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   gender = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   birthyear = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [426,887 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:426887] \"EACB19130B0CDA4A\" \"8FED874C809DC021\" \"789F3C21E472CA96\" \"C9A388DAC6ABF313\" ...\n",
      " $ rideable_type     : chr [1:426887] \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : POSIXct[1:426887], format: \"2020-01-21 20:06:59\" \"2020-01-30 14:22:39\" ...\n",
      " $ ended_at          : POSIXct[1:426887], format: \"2020-01-21 20:14:30\" \"2020-01-30 14:26:22\" ...\n",
      " $ start_station_name: chr [1:426887] \"Western Ave & Leland Ave\" \"Clark St & Montrose Ave\" \"Broadway & Belmont Ave\" \"Clark St & Randolph St\" ...\n",
      " $ start_station_id  : num [1:426887] 239 234 296 51 66 212 96 96 212 38 ...\n",
      " $ end_station_name  : chr [1:426887] \"Clark St & Leland Ave\" \"Southport Ave & Irving Park Rd\" \"Wilton Ave & Belmont Ave\" \"Fairbanks Ct & Grand Ave\" ...\n",
      " $ end_station_id    : num [1:426887] 326 318 117 24 212 96 212 212 96 100 ...\n",
      " $ start_lat         : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:426887] -87.7 -87.7 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:426887] -87.7 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr [1:426887] \"member\" \"member\" \"member\" \"member\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(q2_2019)\n",
    "str(q3_2019)\n",
    "str(q4_2019)\n",
    "str(q1_2020)\n",
    "q2_2019=mutate(q2_2019,\n",
    "               ride_id=as.character(ride_id),\n",
    "               rideable_type=as.character(rideable_type))\n",
    "q3_2019=mutate(q3_2019,\n",
    "               ride_id=as.character(ride_id),\n",
    "               rideable_type=as.character(rideable_type))\n",
    "q4_2019=mutate(q4_2019,\n",
    "               ride_id=as.character(ride_id),\n",
    "               rideable_type=as.character(rideable_type))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1e3fa6c8",
   "metadata": {
    "papermill": {
     "duration": 0.011155,
     "end_time": "2022-07-23T21:46:19.788550",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.777395",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Stacking each quarter into one big dataframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "f0c6f437",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:19.813911Z",
     "iopub.status.busy": "2022-07-23T21:46:19.812282Z",
     "iopub.status.idle": "2022-07-23T21:46:33.873102Z",
     "shell.execute_reply": "2022-07-23T21:46:33.871353Z"
    },
    "papermill": {
     "duration": 14.07672,
     "end_time": "2022-07-23T21:46:33.875959",
     "exception": false,
     "start_time": "2022-07-23T21:46:19.799239",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'01 - Rental Details Duration In Seconds Uncapped'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li><li>'Member Gender'</li><li>'05 - Member Details Member Birthday Year'</li><li>'tripduration'</li><li>'gender'</li><li>'birthyear'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item '01 - Rental Details Duration In Seconds Uncapped'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'Member Gender'\n",
       "\\item '05 - Member Details Member Birthday Year'\n",
       "\\item 'tripduration'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. '01 - Rental Details Duration In Seconds Uncapped'\n",
       "6. 'start_station_id'\n",
       "7. 'start_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'end_station_name'\n",
       "10. 'member_casual'\n",
       "11. 'Member Gender'\n",
       "12. '05 - Member Details Member Birthday Year'\n",
       "13. 'tripduration'\n",
       "14. 'gender'\n",
       "15. 'birthyear'\n",
       "16. 'start_lat'\n",
       "17. 'start_lng'\n",
       "18. 'end_lat'\n",
       "19. 'end_lng'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"                                         \n",
       " [2] \"started_at\"                                      \n",
       " [3] \"ended_at\"                                        \n",
       " [4] \"rideable_type\"                                   \n",
       " [5] \"01 - Rental Details Duration In Seconds Uncapped\"\n",
       " [6] \"start_station_id\"                                \n",
       " [7] \"start_station_name\"                              \n",
       " [8] \"end_station_id\"                                  \n",
       " [9] \"end_station_name\"                                \n",
       "[10] \"member_casual\"                                   \n",
       "[11] \"Member Gender\"                                   \n",
       "[12] \"05 - Member Details Member Birthday Year\"        \n",
       "[13] \"tripduration\"                                    \n",
       "[14] \"gender\"                                          \n",
       "[15] \"birthyear\"                                       \n",
       "[16] \"start_lat\"                                       \n",
       "[17] \"start_lng\"                                       \n",
       "[18] \"end_lat\"                                         \n",
       "[19] \"end_lng\"                                         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "alltrip = bind_rows(q2_2019,q3_2019,q4_2019,q1_2020)\n",
    "colnames(alltrip)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2692874e",
   "metadata": {
    "papermill": {
     "duration": 0.012021,
     "end_time": "2022-07-23T21:46:33.899448",
     "exception": false,
     "start_time": "2022-07-23T21:46:33.887427",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Dropping Inconsistent Columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "6c793aba",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:33.925695Z",
     "iopub.status.busy": "2022-07-23T21:46:33.924140Z",
     "iopub.status.idle": "2022-07-23T21:46:33.946486Z",
     "shell.execute_reply": "2022-07-23T21:46:33.944704Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.038931,
     "end_time": "2022-07-23T21:46:33.949616",
     "exception": false,
     "start_time": "2022-07-23T21:46:33.910685",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "alltrip = alltrip %>%  \n",
    "  select(-c(\"01 - Rental Details Duration In Seconds Uncapped\", \"Member Gender\",\n",
    "            \"05 - Member Details Member Birthday Year\",\n",
    "            \"tripduration\", \"gender\", \"birthyear\",\n",
    "            \"start_lat\", \"start_lng\", \"end_lat\", \"end_lng\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "782fac89",
   "metadata": {
    "papermill": {
     "duration": 0.011607,
     "end_time": "2022-07-23T21:46:33.972874",
     "exception": false,
     "start_time": "2022-07-23T21:46:33.961267",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Changing Vectors of Member Type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "ac327b2e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:33.998929Z",
     "iopub.status.busy": "2022-07-23T21:46:33.997396Z",
     "iopub.status.idle": "2022-07-23T21:46:35.141930Z",
     "shell.execute_reply": "2022-07-23T21:46:35.140196Z"
    },
    "papermill": {
     "duration": 1.160956,
     "end_time": "2022-07-23T21:46:35.145013",
     "exception": false,
     "start_time": "2022-07-23T21:46:33.984057",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "    casual   Customer     member Subscriber \n",
       "     48480     857474     378407    2595461 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(alltrip$member_casual)\n",
    "\n",
    "alltrip =  alltrip %>% \n",
    "  mutate(member_casual = recode(member_casual,\n",
    "                                \"Subscriber\" = \"member\",\n",
    "                                \"Customer\" = \"casual\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7dbbb915",
   "metadata": {
    "papermill": {
     "duration": 0.011456,
     "end_time": "2022-07-23T21:46:35.167674",
     "exception": false,
     "start_time": "2022-07-23T21:46:35.156218",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Calculating Ride Duration"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "328b7896",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:35.193452Z",
     "iopub.status.busy": "2022-07-23T21:46:35.191938Z",
     "iopub.status.idle": "2022-07-23T21:46:41.102847Z",
     "shell.execute_reply": "2022-07-23T21:46:41.100721Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 5.927727,
     "end_time": "2022-07-23T21:46:41.106566",
     "exception": false,
     "start_time": "2022-07-23T21:46:35.178839",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [3,879,822 × 10] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:3879822] \"22178529\" \"22178530\" \"22178531\" \"22178532\" ...\n",
      " $ started_at        : POSIXct[1:3879822], format: \"2019-04-01 00:02:22\" \"2019-04-01 00:03:02\" ...\n",
      " $ ended_at          : POSIXct[1:3879822], format: \"2019-04-01 00:09:48\" \"2019-04-01 00:20:30\" ...\n",
      " $ rideable_type     : chr [1:3879822] \"6251\" \"6226\" \"5649\" \"4151\" ...\n",
      " $ start_station_id  : num [1:3879822] 81 317 283 26 202 420 503 260 211 211 ...\n",
      " $ start_station_name: chr [1:3879822] \"Daley Center Plaza\" \"Wood St & Taylor St\" \"LaSalle St & Jackson Blvd\" \"McClurg Ct & Illinois St\" ...\n",
      " $ end_station_id    : num [1:3879822] 56 59 174 133 129 426 500 499 211 211 ...\n",
      " $ end_station_name  : chr [1:3879822] \"Desplaines St & Kinzie St\" \"Wabash Ave & Roosevelt Rd\" \"Canal St & Madison St\" \"Kingsbury St & Kinzie St\" ...\n",
      " $ member_casual     : chr [1:3879822] \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ ride_length       : num [1:3879822] 446 1048 252 357 1007 ...\n"
     ]
    }
   ],
   "source": [
    "alltrip$ride_length=difftime(\n",
    "  as.POSIXct(alltrip$ended_at, format=\"%Y-%m-%d %H:%M:%S\"),\n",
    "  as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"),\n",
    "  unit=\"secs\"\n",
    ")\n",
    "alltrip$ride_length <- as.numeric(as.character(alltrip$ride_length))\n",
    "str(alltrip)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "59046eb9",
   "metadata": {
    "papermill": {
     "duration": 0.012031,
     "end_time": "2022-07-23T21:46:41.130341",
     "exception": false,
     "start_time": "2022-07-23T21:46:41.118310",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Extracting Time from Date"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "a0ae5ac6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:41.156408Z",
     "iopub.status.busy": "2022-07-23T21:46:41.154839Z",
     "iopub.status.idle": "2022-07-23T21:46:51.552750Z",
     "shell.execute_reply": "2022-07-23T21:46:51.550917Z"
    },
    "papermill": {
     "duration": 10.414129,
     "end_time": "2022-07-23T21:46:51.555696",
     "exception": false,
     "start_time": "2022-07-23T21:46:41.141567",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "alltrip$date = format(as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"), \"%d-%m-%Y\")\n",
    "alltrip$month = format(as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"), \"%m\")\n",
    "alltrip$day = format(as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"), \"%d\")\n",
    "alltrip$year = format(as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"), \"%Y\")\n",
    "#alltrip$day_of_week = format(as.POSIXct(alltrip$started_at, format=\"%Y-%m-%d %H:%M:%S\"), \"%A\", week_start = 1)\n",
    "alltrip$day_of_week = wday(dmy(alltrip$date), label=TRUE, abbr=FALSE, week_start=1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0b4fc21d",
   "metadata": {
    "papermill": {
     "duration": 0.011598,
     "end_time": "2022-07-23T21:46:51.578662",
     "exception": false,
     "start_time": "2022-07-23T21:46:51.567064",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Storing filtered Data into a New Dataframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "8b886d51",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:51.605827Z",
     "iopub.status.busy": "2022-07-23T21:46:51.604074Z",
     "iopub.status.idle": "2022-07-23T21:46:52.318943Z",
     "shell.execute_reply": "2022-07-23T21:46:52.317097Z"
    },
    "papermill": {
     "duration": 0.731538,
     "end_time": "2022-07-23T21:46:52.322062",
     "exception": false,
     "start_time": "2022-07-23T21:46:51.590524",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "alltrip_v2=alltrip[!(alltrip$start_station_name==\"HQ QR\" | alltrip$ride_length<0),]\n",
    "#storing filtered data of alltrip and filteration must be done [,] before comma"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dba5cd78",
   "metadata": {
    "papermill": {
     "duration": 0.011123,
     "end_time": "2022-07-23T21:46:52.344327",
     "exception": false,
     "start_time": "2022-07-23T21:46:52.333204",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Analysis begins here"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "0bac3d21",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2022-07-23T21:46:52.370151Z",
     "iopub.status.busy": "2022-07-23T21:46:52.368515Z",
     "iopub.status.idle": "2022-07-23T21:47:04.477581Z",
     "shell.execute_reply": "2022-07-23T21:47:04.475842Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 12.125819,
     "end_time": "2022-07-23T21:47:04.481128",
     "exception": false,
     "start_time": "2022-07-23T21:46:52.355309",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "      1     412     712    1479    1289 9387024 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alltrip_v2$member_casual</th><th scope=col>alltrip_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>3552.7502</td></tr>\n",
       "\t<tr><td>member</td><td> 850.0662</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " alltrip\\_v2\\$member\\_casual & alltrip\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 3552.7502\\\\\n",
       "\t member &  850.0662\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| alltrip_v2$member_casual &lt;chr&gt; | alltrip_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 3552.7502 |\n",
       "| member |  850.0662 |\n",
       "\n"
      ],
      "text/plain": [
       "  alltrip_v2$member_casual alltrip_v2$ride_length\n",
       "1 casual                   3552.7502             \n",
       "2 member                    850.0662             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alltrip_v2$member_casual</th><th scope=col>alltrip_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1546</td></tr>\n",
       "\t<tr><td>member</td><td> 589</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " alltrip\\_v2\\$member\\_casual & alltrip\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1546\\\\\n",
       "\t member &  589\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| alltrip_v2$member_casual &lt;chr&gt; | alltrip_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1546 |\n",
       "| member |  589 |\n",
       "\n"
      ],
      "text/plain": [
       "  alltrip_v2$member_casual alltrip_v2$ride_length\n",
       "1 casual                   1546                  \n",
       "2 member                    589                  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alltrip_v2$member_casual</th><th scope=col>alltrip_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>9387024</td></tr>\n",
       "\t<tr><td>member</td><td>9056634</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " alltrip\\_v2\\$member\\_casual & alltrip\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 9387024\\\\\n",
       "\t member & 9056634\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| alltrip_v2$member_casual &lt;chr&gt; | alltrip_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 9387024 |\n",
       "| member | 9056634 |\n",
       "\n"
      ],
      "text/plain": [
       "  alltrip_v2$member_casual alltrip_v2$ride_length\n",
       "1 casual                   9387024               \n",
       "2 member                   9056634               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alltrip_v2$member_casual</th><th scope=col>alltrip_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " alltrip\\_v2\\$member\\_casual & alltrip\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| alltrip_v2$member_casual &lt;chr&gt; | alltrip_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 2 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  alltrip_v2$member_casual alltrip_v2$ride_length\n",
       "1 casual                   2                     \n",
       "2 member                   1                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alltrip_v2$member_casual</th><th scope=col>alltrip_v2$day_of_week</th><th scope=col>alltrip_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>3372.2869</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 842.5726</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>3596.3599</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 826.1427</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>3718.6619</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 823.9996</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>3682.9847</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 823.9278</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>3773.8351</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 824.5305</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>3331.9138</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 968.9337</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>3581.4054</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 919.9746</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " alltrip\\_v2\\$member\\_casual & alltrip\\_v2\\$day\\_of\\_week & alltrip\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Monday    & 3372.2869\\\\\n",
       "\t member & Monday    &  842.5726\\\\\n",
       "\t casual & Tuesday   & 3596.3599\\\\\n",
       "\t member & Tuesday   &  826.1427\\\\\n",
       "\t casual & Wednesday & 3718.6619\\\\\n",
       "\t member & Wednesday &  823.9996\\\\\n",
       "\t casual & Thursday  & 3682.9847\\\\\n",
       "\t member & Thursday  &  823.9278\\\\\n",
       "\t casual & Friday    & 3773.8351\\\\\n",
       "\t member & Friday    &  824.5305\\\\\n",
       "\t casual & Saturday  & 3331.9138\\\\\n",
       "\t member & Saturday  &  968.9337\\\\\n",
       "\t casual & Sunday    & 3581.4054\\\\\n",
       "\t member & Sunday    &  919.9746\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| alltrip_v2$member_casual &lt;chr&gt; | alltrip_v2$day_of_week &lt;ord&gt; | alltrip_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Monday    | 3372.2869 |\n",
       "| member | Monday    |  842.5726 |\n",
       "| casual | Tuesday   | 3596.3599 |\n",
       "| member | Tuesday   |  826.1427 |\n",
       "| casual | Wednesday | 3718.6619 |\n",
       "| member | Wednesday |  823.9996 |\n",
       "| casual | Thursday  | 3682.9847 |\n",
       "| member | Thursday  |  823.9278 |\n",
       "| casual | Friday    | 3773.8351 |\n",
       "| member | Friday    |  824.5305 |\n",
       "| casual | Saturday  | 3331.9138 |\n",
       "| member | Saturday  |  968.9337 |\n",
       "| casual | Sunday    | 3581.4054 |\n",
       "| member | Sunday    |  919.9746 |\n",
       "\n"
      ],
      "text/plain": [
       "   alltrip_v2$member_casual alltrip_v2$day_of_week alltrip_v2$ride_length\n",
       "1  casual                   Monday                 3372.2869             \n",
       "2  member                   Monday                  842.5726             \n",
       "3  casual                   Tuesday                3596.3599             \n",
       "4  member                   Tuesday                 826.1427             \n",
       "5  casual                   Wednesday              3718.6619             \n",
       "6  member                   Wednesday               823.9996             \n",
       "7  casual                   Thursday               3682.9847             \n",
       "8  member                   Thursday                823.9278             \n",
       "9  casual                   Friday                 3773.8351             \n",
       "10 member                   Friday                  824.5305             \n",
       "11 casual                   Saturday               3331.9138             \n",
       "12 member                   Saturday                968.9337             \n",
       "13 casual                   Sunday                 3581.4054             \n",
       "14 member                   Sunday                  919.9746             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    }
   ],
   "source": [
    "summary(alltrip_v2$ride_length) #min, Q1, mean, median, Q3, max\n",
    "\n",
    "#MEAN, MEDIAN, MAX, MIN of ride duration by member type\n",
    "aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=mean) \n",
    "aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=median)\n",
    "aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=max)\n",
    "aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=min)\n",
    "\n",
    "#Ride duration by Day of week\n",
    "aggregate(alltrip_v2$ride_length \n",
    "          ~alltrip_v2$member_casual + alltrip_v2$day_of_week, FUN=mean)\n",
    "\n",
    "\n",
    "avg_trip=alltrip_v2 %>% \n",
    "  group_by(member_casual,day_of_week) %>% #it groups weekdays by member type\n",
    "  summarise(number_of_rides = n(), #calculates the no. of rides\n",
    "            average_duration = mean(ride_length)) %>% #calulates the average duration.\n",
    "  arrange(member_casual, day_of_week)  #it sorts"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cf3e485d",
   "metadata": {
    "papermill": {
     "duration": 0.012664,
     "end_time": "2022-07-23T21:47:04.506734",
     "exception": false,
     "start_time": "2022-07-23T21:47:04.494070",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Viz1 for Average Ride Duration"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "852ba162",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:47:04.535389Z",
     "iopub.status.busy": "2022-07-23T21:47:04.533638Z",
     "iopub.status.idle": "2022-07-23T21:47:05.339054Z",
     "shell.execute_reply": "2022-07-23T21:47:05.337320Z"
    },
    "papermill": {
     "duration": 0.822145,
     "end_time": "2022-07-23T21:47:05.341394",
     "exception": false,
     "start_time": "2022-07-23T21:47:04.519249",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nGPzHXVmWzcbYCL2m0WdnLIv6FPSu8PohWZYTb3wqhNh8O9naxe7uD//HjdBrSnb80rpo7rSp\n6y4lWKbNpkS1JFnCSsK1D4UQy649+N8u6cZqIYQl2GXdf0bf9y73ePgo0mL09TSTZQVLNrq0\no71K7bX7fsqDHU75u6iHxhLs7N/WE4LdbiFEn3O2g509YyLL8trywSWf25+x+PgrHwghpv15\n3/rjA8L9CtZZaZmu6KUt0WGDddHQIr4V3/jpkSKz7mFX3UKF6u56fH/3timuD2i2+7/27Nmb\n9S7cPzNMktQbbiVZFqXF/9SwYcM1t5MtpYZ3WG/t//VCPpXe+vnx7VqCnTHtir9GNe1inCzL\nsf+8q9YVijGYrcEu699aRS/tU+8dt0zHXZoohJh07sHv5cibkT6F+sn/hqrG805Ze1j3fEkP\n/8Y2O3/kV5mpR4KdLMudCnhVHnZUlmXZbKjn51F37ilrDfVnPlxz/QslPYOftVkDACDP5L+H\nJ+Kjpx+JTxPTa0rTHzZuHfPjvB3tJbX//DbFuk9eIvrOTLmz/vObSesm1RRCxF/YLIToGPqf\ni3c6n4cPLZZ8+Snr9JCRgw/t2Dpr9dlLly7+eexbk/zg8tutw5vVHkV6F/a2zHoVfKmEvveD\nkmz1n5E+oHlKzL8XsOT06BO7Wjfs/HT/NmeXNbGuc3HNX15hr7QO1Ftm1fpSY4r5TnB8W49L\nTzwmhKjqbfupWHvGJFN3jnyt0gSOrBBobendKXzZsrVC9LTMlupb27qogFYlP9abzR6eJIuH\nJ560C1e2HNT61Hjx3/HU+dY9fPiw9adK96uTsVTx5P1W64pOqRj00bRToxfV/2Py+gI1ZgRo\nHl6HtflbC23y4EkGtTZECBFV6MFh5hHiIeSHNyO+2rWkdbrl+0+nfbXsYprJw5HD207j3ixf\nf95EMWtnzNkJRxLFkVfLWBf16lHKOt30ndopX66/kW4WOTssAQC5Jf8Fu18nrPDwq3/wmznW\nltOzu7++Y1iyuZ2XSmowo2dCuSmH46d4zZnmX3JElwKeQgitj7ckqa/du+uV4aZ7SVJbpz0L\nPngjhtlw8/nI8oc8ar/RtW29VrV6vzWtYWTRB4tSH73Z3/oft83+n0jSlXzquQUNCr64d7MQ\nD4OdSqMS4j/PB4R4aYQxZ9sSQghxacM2lTaoR6j344uSzf+JLfaMyZP36z/FSxpJlg3WWa2f\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "viz_v1 = ggplot(data=avg_trip)+\n",
    "  geom_col(mapping=aes(\n",
    "               x=day_of_week,y=average_duration,fill=member_casual),color=\"yellow\",\n",
    "           position=\"dodge\")+ #it separates the member type\n",
    "  coord_cartesian(xlim=c(NA,7),ylim=c(NA,4000))\n",
    "  #coord_flip( xlim = c(3, 7),ylim = c(800,4000)) #it flips axis and limits range\n",
    "  \n",
    "#Changing plot Title and axis title name\n",
    "viz_v1   = viz_v1+\n",
    "  labs(title=\"Average Ride Duration of Each Member Type\", \n",
    "       x=\"WeekDays\", y=\"Average Ride Duration in Seconds\")\n",
    "\n",
    "#changing size of plot title and axis titles and axis text\n",
    "viz_v1=viz_v1+\n",
    "  theme(axis.text.x = element_text(size = 5))+ \n",
    "  theme(axis.text.y = element_text(size = 6))+ \n",
    "  theme(axis.title = element_text(size = 7))+\n",
    "  theme(plot.title = element_text(size = 9))+\n",
    "  theme(legend.position = \"top\")\n",
    "  \n",
    "\n",
    "#changing legend and its label name  \n",
    "viz_v1 = viz_v1 +\n",
    "  scale_fill_discrete(name=\"Member Type\", labels=c(\"Casual\",\"Subscriber\"))\n",
    "\n",
    "viz_v1\n",
    "\n",
    "#exporting viz\n",
    "ggsave(\"viz_1.png\", width=1366, height=768, unit=\"px\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ec9f1dba",
   "metadata": {
    "papermill": {
     "duration": 0.013442,
     "end_time": "2022-07-23T21:47:05.368256",
     "exception": false,
     "start_time": "2022-07-23T21:47:05.354814",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Viz2 for Number of Rides"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "9cdae1ea",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-23T21:47:05.399223Z",
     "iopub.status.busy": "2022-07-23T21:47:05.397398Z",
     "iopub.status.idle": "2022-07-23T21:47:05.927179Z",
     "shell.execute_reply": "2022-07-23T21:47:05.925427Z"
    },
    "papermill": {
     "duration": 0.547518,
     "end_time": "2022-07-23T21:47:05.929457",
     "exception": false,
     "start_time": "2022-07-23T21:47:05.381939",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nehyzs9vtgbiioqJUWmCcsQMAAFAExQ4AAEAR4XopFrXXpUsXEenYsaPRg4SH5s2b9+7d2263\nGz1IeIiMjOzdu7eIxMXFGT1LeLjkkkuysrLatm1r9CDhoWPHjh6Pp3Xr1kYPEh6Sk5MDx6PF\nwlmbE7Pb7YG4VLoOKyKarutGzwAAAIA6QKkHAABQBMUOAABAEbzHLlzl7Jk1YsKBf77znEPT\nRGTLE3fM/rn/m89fXZvPzdr60ELHPdPPbChvilr26MM/5JVk7djqOLNztEXrdf/Uy2KdIX0F\nhRNbO25owYwX+ye6jv7n4bHPnPn24htE5MmbBw144a1WLmvV+//hKJTMsNLS6np5yY5WD05t\n/Uf+GJOS+dRGUeYHQ8f9q2Ob6MDN26c+dLrTKiJHvp65tOX4sc2Ob2+g+ei+ZQsf3pJtlRKP\nu+OA+4dcVGm/v+S33blxZyS5av4yDS69E+VWHTWCotiFsegzCt7OKLj5tCgReXd7sgR5FoaI\nyPUTp10vsm70kCZTZnSJ5LciKuhwdbNF247175m85909nYt/yfUNckvuN/q59wRrdaik0tI6\nunn6jhN+ju4TjWwriG034uGHulbYpPsaXzh9rEHzmIcn/bn/s1/3zPQuIrLmgeGfXXNepRel\nRcfWPfdNz7l9WwT55Aa80k6Ym9oodmGs8UU3fPXPPTePP6v42NrMi66Ub3J8xQcWzHwhL9JZ\n6GqbNv7GY99Pn/OfqEZZ+u8Hiu59fFrjku2PznjDFx/liv9NrpDSgu3zHlmmR1myixJmpo3+\n8oERzWa+1CHCtmzMLRfPX9zUoewjQsank5d1mDKuWfTed8d/cemsm+LzFs9elGW15knTBybd\nYju0/u/PfR3hyIvsdOtdVxUrn1ij7n869MR+6Zm8+lDr4X2z3z1ccIP9w8i2ffzeI+VjiSzc\nWj6Ko5srLK2mWmZDzrC8w5+/8dTyY3t2lzwwd5p8MbX8Srsqfc6i9NMidjUZPSi6weZzQkc3\nTw+kNLT7t2+0mTwudm9Dzsdijczd+dW2fU07t0y6atbzPruzUgIr39p8OD19hf/3vd3Tqq60\nu29v2zDTq5pbpYf9q9LnKPzkSLELY47obm1+eUGXszI+/vDK1Lvf+iZnz9K5UcNn3nNm7K5l\n45/Z9ZchIsVa/4n3d9j33n3LM4sufOmps+59akDzqC//ftt6kZLsQ+ePub9Xs8hvp97yQ563\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "viz_v2 = ggplot(data=avg_trip)+\n",
    "  geom_col(mapping=aes(\n",
    "    x=day_of_week,y=number_of_rides,fill=member_casual),color=\"yellow\",\n",
    "    position=\"dodge\") #it separates the member type\n",
    "#Changing plot Title and axis title name\n",
    "viz_v2   = viz_v2+\n",
    "  labs(title=\"Number of Rides of Each Member Type\", \n",
    "       x=\"WeekDays\", y=\"Number of Rides in Millions\")\n",
    "\n",
    "#exapanding limits and changing its unit to make it more readeable\n",
    "viz_v2   = viz_v2+\n",
    "  expand_limits(x = c(0, NA), y = c(0, NA)) +\n",
    "  scale_y_continuous(labels = unit_format(unit = \"M\", scale = 1e-5)) #load library(scales)\n",
    "\n",
    "#changing size of plot title and axis titles and axis text\n",
    "viz_v2=viz_v2+\n",
    "  theme(axis.text.x = element_text(size = 5))+ \n",
    "  theme(axis.text.y = element_text(size = 6))+ \n",
    "  theme(axis.title = element_text(size = 7))+\n",
    "  theme(plot.title = element_text(size = 9))+\n",
    "  theme(legend.position = \"top\")\n",
    "\n",
    "\n",
    "#changing legend and its label name  \n",
    "viz_v2 = viz_v2 +\n",
    "  scale_fill_discrete(name=\"Member Type\", labels=c(\"Casual\",\"Subscriber\"))\n",
    "\n",
    "viz_v2\n",
    "\n",
    "ggsave(\"viz_2.png\", width=1366, height=720, unit=\"px\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 62.050242,
   "end_time": "2022-07-23T21:47:06.164571",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-07-23T21:46:04.114329",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
