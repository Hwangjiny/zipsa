package com.sesoc.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CatVO {
	private int cat_no;
	private String userid;
	private String catname;
	private String cat_birth;
}
