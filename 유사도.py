from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer
import pandas as pd
import numpy as np
stayInfo_df = pd.read_csv('C:\\TMSTSTAY.csv')

tfidf = TfidfVectorizer()

tfidf_matrix_room = tfidf.fit_transform(stayInfo_df['S_INFO'])

cosine_sim_room = linear_kernel(tfidf_matrix_room, tfidf_matrix_room)

indices_room=pd.Series(stayInfo_df.index,index=stayInfo_df['S_NAME']).drop_duplicates()

def get_recommendation_room(S_NAME, cosine_sim_room=cosine_sim_room):
    idx_book=indices_room[S_NAME]
    sim_scores_book = list(enumerate(cosine_sim_room[idx_book]))
    sim_scores_book = sorted(sim_scores_book,key=lambda x:x[1],reverse=True)
    sim_scores_book = sim_scores_book[1:7]
    book_indices=[i[1] for i in sim_scores_book]
    return stayInfo_df['S_NAME'].iloc[book_indices]

print(get_recommendation_room('에덴파라다이스호텔'))


# indices_book = pd.Series(
# stayInfo_df.index, index=stayInfo_df['S_NAME']).drop_duplicates()

# stayInfo_df.columns = ['S_NO', 'S_NAME', 'S_TYPE', 'S_INFO']


# def get_recommendations_book(S_INFO, cosine_sim_book=cosine_sim_book):
#     #  index값을 가져오기
#     idx_book = indices_book[S_INFO]
#     sim_scores_book = list(enumerate(cosine_sim_book[idx_book]))
#     # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
#     sim_scores_book = sorted(sim_scores_book, key=lambda x: x[1], reverse=True)
#     # 코사인 유사도 기준으로 내림차순정렬

#     sim_scores_book = sim_scores_book[1:4]
#     # 자신을 제외한 7개의 추천 영화를 슬라이싱
#     # 추천서적목록 인덱스 정보 추출
#     title_indices_book = [i[0] for i in sim_scores_book]
#     return stayInfo_df['S_NAME'].iloc[title_indices_book]


# print(get_recommendations_book('서울'))