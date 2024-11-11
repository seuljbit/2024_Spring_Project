package com.ezen.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LPVO {
    private int lpId;             // 매핑: lp_id
    private String lpTitle;       // 매핑: lp_title
    private String lpArtist;      // 매핑: lp_artist
    private String lpGenre;       // 매핑: lp_genre
    private int lpPrice;          // 매핑: lp_price
    private String lpDescription; // 매핑: lp_description
    private String lpTract;       // 매핑: lp_tract
    private String lpImagePath;   // 매핑: lp_image_path
}