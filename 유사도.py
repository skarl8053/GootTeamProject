import pandas as pd
import numpy as np
roomdf = pd.read_csv('C:\\GootTeamProject\\TMSTROOM_DATA_TABLE.csv')
roomdf

from sklearn.feature_extraction.text import TfidfVectorizer
tfidf=TfidfVectorizer()

tfidf_matrix_room=tfidf.fit_transform(roomdf['R_DETAIL'])
tfidf_matrix_room.shape

from sklearn.metrics.pairwise import linear_kernel
cosine_sim_room=linear_kernel(tfidf_matrix_room,tfidf_matrix_room)
cosine_sim_room

indices_room=pd.Series(roomdf.index,index=roomdf['R_NAME']).drop_duplicates()
#print(indices_room['소노캄 거제 101호']);

def get_recommendations_room(R_NAME,cosine_sim_room=cosine_sim_room):

    #영화 제목을 통해서 전체 데이터 기준 그 영화의 index값을 가져오기
    idx_room=indices_room[R_NAME]
    sim_scores_room=list(enumerate(cosine_sim_room[idx_room]))

    # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
    sim_scores_room=sorted(sim_scores_room,key=lambda x:x[1],reverse=True)

    # 코사인 유사도 기준으로 내림차순정렬
    sim_scores_room=sim_scores_room[1:7] 

    # 자신을 제외한 7개의 추천 영화를 슬라이싱
    # 추천서적목록 인덱스 정보 추출
    return roomdf['R_NAME'].iloc[[i[0] for i in sim_scores_room]]

print(get_recommendations_room('쏠비치 진도 102호'));

def callsim(v4):
    btitle=get_recommendations_room(v4)
    
    print(btitle)
def main(argv):
    #callsim(argv[1], argv[2])
    callsim(argv[1])
    
if __name__ == "__main__":
    main(sys.argv)