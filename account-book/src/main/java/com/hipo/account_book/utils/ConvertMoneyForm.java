package com.hipo.account_book.utils;

import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ConvertMoneyForm {

	final public static String convertForForm(String money) { // 2000 -> 2,000원
		boolean convertingDone = false;// String이 int로 변환여부 체크(전역으로 사용하기
										// this.converingDone=true;)
		try {
			Integer.parseInt(money);
			convertingDone = true;
		} catch (Exception e) {
			convertingDone = false;
			System.out.println(e.getMessage() + " 숫자만 입력해주세요.");
			return "";
		}

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < money.length(); i++) {
			sb.append(money.charAt(i));
			if ((money.length() - (i + 1)) % 3 == 0) {
				if (money.length() - 1 == i) {

				} else {
					sb.append(",");
				}
			}
		}
		sb.append("원");
		return sb.toString();
	}

	final public static int convertMoney(String money) {//2,000원 -> 2000(int형)
		StringBuilder sb = new StringBuilder();
		StringTokenizer token = new StringTokenizer(money, ",");
		while (token.hasMoreTokens()) {
			sb.append(token.nextToken());
		}
		Pattern p = null;
		Matcher m;
		p = Pattern.compile("(.*?)원");
		m = p.matcher(sb);
		String mon = "";
		if (m.find()) {
			mon = m.group(1);
		}
		return Integer.parseInt(mon);
	}

}
