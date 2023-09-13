
import sys
import pandas as pd
import numpy as np
roomdf = pd.read_csv('C:\\GootTeamProject\\TravelProject\\TMSTSTAY_DATA_TABLE.csv')


from sklearn.feature_extraction.text import TfidfVectorizer
tfidf=TfidfVectorizer()

tfidf_matrix_room=tfidf.fit_transform(roomdf['S_INFO'])


from sklearn.metrics.pairwise import linear_kernel
cosine_sim_room=linear_kernel(tfidf_matrix_room, tfidf_matrix_room)

indices_room=pd.Series(roomdf.index,index=roomdf['S_NO']).drop_duplicates()

def get_recommendations_stay(title,cosine_sim_room=cosine_sim_room):

    #영화 제목을 통해서 전체 데이터 기준 그 영화의 index값을 가져오기
    idx_room=indices_room[title]
    sim_scores_room=list(enumerate(cosine_sim_room[idx_room]))

    # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
    sim_scores_room=sorted(sim_scores_room,key=lambda x:x[1],reverse=True)

    # 코사인 유사도 기준으로 내림차순정렬
    sim_scores_room=sim_scores_room[1:6] # 데이터 6개 추출 

    # 자신을 제외한 7개의 추천 영화를 슬라이싱
    # 추천서적목록 인덱스 정보 추출

    room_indices_code = [i[0] for i in sim_scores_room];
    
    return roomdf['S_NO'].iloc[room_indices_code];

print(get_recommendations_stay(41));

# def callsim(v4):
#     btitle=get_recommendations_stay(v4)
    
#     print(btitle)
# def main(argv):
#     #callsim(argv[1], argv[2])
#     callsim(int(argv[1]))
    
# if __name__ == "__main__":
#     main(sys.argv)