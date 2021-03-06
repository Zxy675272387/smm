
  
package com.invoicing.manage.request; 

import com.invoicing.manage.comment.entity.BaseRequestEntity;
 
/** 
 * 类名: AreaEntityRequestEntity   
 * 类描述: TODO.
 */
@SuppressWarnings("serial")
public class AreaRequestEntity extends BaseRequestEntity{
	
	/**
     *区域
     */
    private String shortMapName;
    /**
     * 简称
     */
    private String shortName;
    /**
     * 拼音
     */
    private String spelling;
    
    /**
     * 名称
     */
    private String name;

	public String getShortMapName() {
		return shortMapName;
	}

	public void setShortMapName(String shortMapName) {
		this.shortMapName = shortMapName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getSpelling() {
		return spelling;
	}

	public void setSpelling(String spelling) {
		this.spelling = spelling;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
    
}
